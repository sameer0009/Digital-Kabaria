import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:domain_models/domain_models.dart';
import 'package:data_layer/data_layer.dart';
import '../controller/pickup_controller.dart';

final dealerPickupsProvider = StreamProvider.autoDispose<List<PickupOrder>>((ref) {
  final repo = ref.watch(pickupRepositoryProvider);
  final user = ref.watch(authStateChangesProvider).value;
  if (user == null) return Stream.value([]);
  return repo.watchDealerPickups(user.uid);
});

class DealerJobsScreen extends ConsumerWidget {
  const DealerJobsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickupsAsync = ref.watch(dealerPickupsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Accepted Jobs'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: pickupsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error loading jobs: $e')),
        data: (pickups) {
          if (pickups.isEmpty) {
            return const Center(child: Text('No active pickup jobs.'));
          }

          return ListView.builder(
            itemCount: pickups.length,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              final job = pickups[index];
              return Card(
                color: AppColors.surface,
                margin: const EdgeInsets.only(bottom: 12.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(job.status.name.toUpperCase()),
                            backgroundColor: switch (job.status) {
                              PickupStatus.completed => AppColors.success.withValues(alpha: 0.2),
                              PickupStatus.disputed => AppColors.error.withValues(alpha: 0.2),
                              PickupStatus.cancelled => AppColors.error.withValues(alpha: 0.2),
                              _ => AppColors.primaryLight.withValues(alpha: 0.2),
                            },
                          ),
                          if (job.scheduledTime != null) Text(job.scheduledTime!, style: AppTypography.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Listing ID: ${job.listingId}', style: AppTypography.titleMedium),
                          if (job.status == PickupStatus.scheduled) ...[
                            const SizedBox(height: 16),
                            const Text('Verification Required', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'Enter 4-digit OTP from Seller',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    ),
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                    onChanged: (val) {
                                      if (val.length == 4) {
                                        ref.read(pickupControllerProvider.notifier)
                                          .verifyPickupOTP(order: job, enteredOtp: val)
                                          .then((success) {
                                            if (!context.mounted) return;
                                            if (success) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('OTP Verified! Proceed to pickup.'), backgroundColor: AppColors.success)
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Invalid OTP. Please check with seller.'), backgroundColor: AppColors.error)
                                              );
                                            }
                                          });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: (job.status != PickupStatus.arrived) ? null : () {
                                    ref.read(pickupControllerProvider.notifier).completePickup(
                                      order: job,
                                      actualWeight: 10.0, // Mock for now
                                      finalAmount: 50.0,  // Mock for now
                                    ).then((_) {
                                      if (!context.mounted) return;
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pickup Completed!'), backgroundColor: AppColors.success));
                                      _showRatingDialog(context, ref, job, isSellerRating: true);
                                    });
                                  },
                                  child: Text(job.status == PickupStatus.completed ? 'Completed' : 'Confirm Pickup'),
                                ),
                              ),
                              if (job.status != PickupStatus.completed && job.status != PickupStatus.disputed) ...[
                                const SizedBox(width: 8),
                                OutlinedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Report a Problem'),
                                        content: const TextField(
                                          decoration: InputDecoration(hintText: 'Describe the issue...'),
                                        ),
                                        actions: [
                                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                                          TextButton(
                                            onPressed: () {
                                              ref.read(pickupControllerProvider.notifier).reportDispute(
                                                order: job,
                                                reason: 'User reported via UI',
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Report'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text('Report Problem'),
                                ),
                              ],
                            ],
                          ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showRatingDialog(BuildContext context, WidgetRef ref, PickupOrder job, {required bool isSellerRating}) {
    double selectedRating = 5.0;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(isSellerRating ? 'Rate the Seller' : 'Rate the Dealer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('How was your experience with this transaction?'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => IconButton(
                icon: const Icon(Icons.star, color: Colors.amber),
                onPressed: () => selectedRating = index + 1.0,
              )),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Add a comment (optional)'),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Skip')),
          ElevatedButton(
            onPressed: () {
              ref.read(pickupControllerProvider.notifier).submitRating(
                pickupOrderId: job.id,
                fromUserId: isSellerRating ? job.dealerId : job.sellerId,
                toUserId: isSellerRating ? job.sellerId : job.dealerId,
                score: selectedRating,
                review: 'Completed via App',
              );
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
