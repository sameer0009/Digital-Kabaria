import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class AdminOverviewScreen extends StatelessWidget {
  const AdminOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Platform Overview', style: AppTypography.headlineLarge),
          const SizedBox(height: 32),
          Row(
            children: [
              _buildKpiCard('Total Users', '142', AppColors.primary),
              const SizedBox(width: 16),
              _buildKpiCard('Active Listings', '28', AppColors.secondary),
              const SizedBox(width: 16),
              _buildKpiCard('Pending Pickups', '12', Colors.blue),
              const SizedBox(width: 16),
              _buildKpiCard('Disputed', '2', AppColors.error),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildKpiCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        color: AppColors.surface,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.titleMedium.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              Text(value, style: AppTypography.displayMedium.copyWith(color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
