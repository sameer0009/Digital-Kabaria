import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:domain_models/domain_models.dart';
import 'package:data_layer/data_layer.dart';

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
                          Chip(label: Text(job.status.name.toUpperCase()), backgroundColor: AppColors.primaryLight.withValues(alpha: 0.2)),
                          if (job.scheduledTime != null) Text(job.scheduledTime!, style: AppTypography.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Listing ID: ${job.listingId}', style: AppTypography.titleMedium),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: job.status == PickupStatus.completed ? null : () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Confirming Picked Up Status...'), backgroundColor: AppColors.success));
                          },
                          child: Text(job.status == PickupStatus.completed ? 'Completed' : 'Confirm Pickup'),
                        ),
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
}
