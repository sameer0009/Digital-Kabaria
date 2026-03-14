import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_core/shared_core.dart';
import '../../common/controller/category_controller.dart';

class SellerHomeScreen extends ConsumerWidget {
  const SellerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Kabaria'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // TODO: Profile/Settings
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Banner/Stats
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: AppColors.primary,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Turn Scrap into Value', style: AppTypography.titleLarge.copyWith(color: Colors.white)),
                      const SizedBox(height: 8),
                      Text('Schedule a pickup and let dealers bid for your scrap.', style: AppTypography.bodyMedium.copyWith(color: Colors.white70)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context.go('${AppRoutes.sellerHome}/${AppRoutes.sellerCreateListing}'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary),
                        child: const Text('New Request'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('What do you want to sell?', style: AppTypography.titleMedium),
            ),
          ),
          
          categoriesAsync.when(
            loading: () => const SliverToBoxAdapter(child: Center(child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator()))),
            error: (e, st) => SliverToBoxAdapter(child: Center(child: Text('Error loading categories: $e'))),
            data: (categories) => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final cat = categories[index];
                    return InkWell(
                      onTap: () {
                         context.go('${AppRoutes.sellerHome}/${AppRoutes.sellerCreateListing}');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.divider),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.recycling, size: 40, color: AppColors.primaryLight),
                            const SizedBox(height: 8),
                            Text(cat.name, style: AppTypography.labelLarge, textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: categories.length,
                ),
              ),
            ),
          ),

          // Recent Activity
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Recent Activity', style: AppTypography.titleMedium),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: AppColors.surface,
                child: ListTile(
                  leading: CircleAvatar(backgroundColor: AppColors.divider, child: Icon(Icons.history, color: AppColors.textSecondary)),
                  title: Text('No recent activity'),
                  subtitle: Text('Create your first request to get started.'),
                ),
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
        ],
      ),
    );
  }
}
