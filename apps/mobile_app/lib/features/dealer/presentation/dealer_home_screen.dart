import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_core/shared_core.dart';
import '../controller/dealer_controller.dart';


class DealerHomeScreen extends ConsumerWidget {
  const DealerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchingLeadsAsync = ref.watch(matchingLeadsProvider);
    // Scaffold dealer home screen
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Leads'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
               // KYC Profile settings stub
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Filters stub
            },
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: AppColors.surface,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('12', style: AppTypography.headlineLarge.copyWith(color: AppColors.primary)),
                            const SizedBox(height: 4),
                            Text('New Leads', style: AppTypography.labelMedium),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Card(
                      color: AppColors.surface,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('3', style: AppTypography.headlineLarge.copyWith(color: AppColors.secondary)),
                            const SizedBox(height: 4),
                            Text('Pending Quotes', style: AppTypography.labelMedium),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
              child: Text('Matching Requests near you', style: AppTypography.titleMedium),
            ),
          ),

          matchingLeadsAsync.when(
            loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            error: (e, st) => SliverFillRemaining(child: Center(child: Text('Error: $e'))),
            data: (leads) {
              if (leads.isEmpty) {
                return const SliverFillRemaining(child: Center(child: Text('No leads found for your categories.')));
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final lead = leads[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      color: AppColors.surface,
                      child: InkWell(
                        onTap: () {
                          context.go(AppRoutes.dealerListingDetail.replaceAll(':id', lead.id));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Chip(
                                    label: Text(lead.categoryId),
                                    backgroundColor: AppColors.divider,
                                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const Text('Near you', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(lead.title, style: AppTypography.titleMedium),
                              const SizedBox(height: 4),
                              Text('Est. Quantity: ${lead.quantityEstimate} ${lead.unit}', style: AppTypography.bodyMedium),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (lead.createdAt != null)
                                    Text('Submitted ${DateTime.now().difference(lead.createdAt!).inHours}h ago', style: AppTypography.bodySmall),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.go(AppRoutes.dealerListingDetail.replaceAll(':id', lead.id));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                      minimumSize: const Size(0, 36),
                                    ),
                                    child: const Text('View & Quote'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: leads.length,
                ),
              );
            },
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
        ],
      ),
    );
  }
}
