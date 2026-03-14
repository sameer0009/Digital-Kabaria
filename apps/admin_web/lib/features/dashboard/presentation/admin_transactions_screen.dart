import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:domain_models/domain_models.dart';

class AdminTransactionsScreen extends ConsumerWidget {
  const AdminTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Platform Transactions', style: AppTypography.headlineLarge),
          const SizedBox(height: 32),
          Expanded(
            child: Card(
              color: AppColors.surface,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Transaction ID')),
                    DataColumn(label: Text('Pickup ID')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Method')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: [
                    _buildRow('TX-991', 'PK-101', '₹450.00', 'Cash', PaymentStatus.paid),
                    _buildRow('TX-992', 'PK-105', '₹1,200.00', 'Digital', PaymentStatus.paid),
                    _buildRow('TX-993', 'PK-108', '₹85.00', 'Cash', PaymentStatus.pending),
                    _buildRow('TX-994', 'PK-110', '₹340.00', 'Cash', PaymentStatus.failed),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(String id, String pickup, String amount, String method, PaymentStatus status) {
    return DataRow(cells: [
      DataCell(Text(id)),
      DataCell(Text(pickup)),
      DataCell(Text(amount)),
      DataCell(Text(method)),
      DataCell(
        Chip(
          label: Text(status.name.toUpperCase()),
          backgroundColor: switch (status) {
            PaymentStatus.paid => AppColors.success.withValues(alpha: 0.1),
            PaymentStatus.failed => AppColors.error.withValues(alpha: 0.1),
            _ => Colors.grey.withValues(alpha: 0.1),
          },
        ),
      ),
    ]);
  }
}
