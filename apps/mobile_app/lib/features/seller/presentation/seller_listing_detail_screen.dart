import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:domain_models/domain_models.dart';
import 'package:data_layer/data_layer.dart';
import '../controller/listing_controller.dart';
import '../../dealer/controller/pickup_controller.dart';

// Provides quotes for a specific listing
final listingQuotesProvider = StreamProvider.family.autoDispose<List<Quote>, String>((ref, listingId) {
  final repo = ref.watch(quoteRepositoryProvider);
  return repo.watchListingQuotes(listingId);
});

final listingPickupProvider = StreamProvider.family.autoDispose<PickupOrder?, String>((ref, listingId) {
  final repo = ref.watch(pickupRepositoryProvider);
  return repo.watchListingPickup(listingId);
});

class SellerListingDetailScreen extends ConsumerWidget {
  final String listingId;
  const SellerListingDetailScreen({super.key, required this.listingId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingsAsync = ref.watch(sellerListingsProvider);
    final quotesAsync = ref.watch(listingQuotesProvider(listingId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Details'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: listingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (listings) {
          final listing = listings.where((l) => l.id == listingId).firstOrNull;
          if (listing == null) return const Center(child: Text('Listing not found'));

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                      label: Text(listing.status.name.toUpperCase()),
                      backgroundColor: AppColors.primaryLight.withValues(alpha: 0.2),
                      labelStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                    Text('${listing.quantityEstimate} ${listing.unit}', style: AppTypography.titleMedium),
                  ],
                ),
                const SizedBox(height: 16),
                Text(listing.title, style: AppTypography.headlineMedium),
                const SizedBox(height: 8),
                Text(listing.description, style: AppTypography.bodyMedium),
                const SizedBox(height: 24),
                
                ref.watch(listingPickupProvider(listingId)).when(
                  loading: () => const SizedBox(),
                  error: (_, _) => const SizedBox(),
                  data: (pickup) {
                    if (pickup == null) return const SizedBox();
                    
                    if (pickup.status == PickupStatus.completed) {
                      return Card(
                        color: AppColors.success.withValues(alpha: 0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.check_circle, color: AppColors.success),
                                  const SizedBox(width: 8),
                                  Text('Pickup Completed', style: AppTypography.titleMedium.copyWith(color: AppColors.success)),
                                ],
                              ),
                              const SizedBox(height: 12),
                              const Text('How was your experience with the dealer?'),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => _showRatingDialog(context, ref, pickup, isSellerRating: false),
                                  child: const Text('Rate the Dealer'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    
                    return Card(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.security, color: AppColors.primary),
                                const SizedBox(width: 8),
                                Text('Pickup Verification', style: AppTypography.titleMedium.copyWith(color: AppColors.primary)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text('Share this code with the dealer only when they arrive at your location:'),
                            const SizedBox(height: 16),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  pickup.otpCode ?? '----',
                                  style: AppTypography.headlineLarge.copyWith(color: Colors.white, letterSpacing: 8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const Divider(),
                const SizedBox(height: 16),
                Text('Incoming Quotes', style: AppTypography.titleMedium),
                const SizedBox(height: 8),
                
                quotesAsync.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (e, st) => Text('Error loading quotes: $e'),
                  data: (quotes) {
                    if (quotes.isEmpty) {
                      return Card(
                        color: AppColors.surface,
                        child: const ListTile(
                          leading: Icon(Icons.person, color: AppColors.textSecondary),
                          title: Text('No quotes yet'),
                          subtitle: Text('We will notify you when dealers respond.'),
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quotes.length,
                      itemBuilder: (context, index) {
                        final quote = quotes[index];
                        return Card(
                          color: AppColors.surface,
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Dealer Name', style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text('\$${quote.amount}', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                if (quote.message != null && quote.message!.isNotEmpty)
                                  Text(quote.message!, style: AppTypography.bodyMedium),
                                const SizedBox(height: 8),
                                if (quote.expectedPickupTiming != null)
                                  Text('Pickup: ${quote.expectedPickupTiming}', style: AppTypography.bodySmall),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        ref.read(listingControllerProvider.notifier)
                                          .acceptQuote(listing, quote)
                                          .then((_) {
                                            if (!context.mounted) return;
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Quote Accepted! Order generated.'), backgroundColor: AppColors.success));
                                          });
                                      },
                                      child: const Text('Accept Quote'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
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
            const Text('How was your experience?'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => IconButton(
                icon: const Icon(Icons.star, color: Colors.amber),
                onPressed: () => selectedRating = index + 1.0,
              )),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Comment...'),
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
                review: 'Rating from app',
              );
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thank you for your feedback!'), backgroundColor: AppColors.success));
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
