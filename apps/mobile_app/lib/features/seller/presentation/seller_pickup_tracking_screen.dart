import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class SellerPickupTrackingScreen extends ConsumerWidget {
  final String pickupId;
  const SellerPickupTrackingScreen({super.key, required this.pickupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Scaffold UI mocking the stream of a pickup status
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Pickup'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Card(
              color: AppColors.surface,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Icon(Icons.local_shipping, size: 64, color: AppColors.primary),
                    const SizedBox(height: 16),
                    Text('Scheduled', style: AppTypography.headlineMedium.copyWith(color: AppColors.primary)),
                    const SizedBox(height: 8),
                    Text('Arriving: Tomorrow between 10AM - 12PM', style: AppTypography.bodyMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),
            Row(
              children: [
                const CircleAvatar(radius: 24, backgroundColor: AppColors.divider, child: Icon(Icons.person)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Assigned Dealer', style: AppTypography.titleMedium),
                      const SizedBox(height: 4),
                      Text('Scrap Kings LLC', style: AppTypography.bodyMedium),
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.phone, color: AppColors.primary), onPressed: () {}),
              ],
            ),
            const Spacer(),
            Text('OTP for Completion: 1234', style: AppTypography.headlineMedium.copyWith(letterSpacing: 4.0, color: AppColors.secondary)),
            const SizedBox(height: 8),
            const Text('Show this PIN to the verification partner.', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
