import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Users & KYC Verification', style: AppTypography.headlineMedium),
          const SizedBox(height: 24),
          Expanded(
            child: Card(
              color: AppColors.surface,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  DataTable(
                    headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                    columns: const [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Role')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('KYC Status')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: [
                      DataRow(cells: [
                        const DataCell(Text('usr_1029')),
                        const DataCell(Text('Dealer')),
                        const DataCell(Text('Scrap Kings LLC')),
                        DataCell(Chip(label: const Text('Pending'), backgroundColor: AppColors.secondary.withValues(alpha: 0.2))),
                        DataCell(TextButton(onPressed: () {}, child: const Text('Review'))),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('usr_8831')),
                        const DataCell(Text('Seller')),
                        const DataCell(Text('John Doe')),
                        DataCell(Chip(label: const Text('Verified'), backgroundColor: AppColors.success.withValues(alpha: 0.2))),
                        DataCell(TextButton(onPressed: () {}, child: const Text('View'))),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
