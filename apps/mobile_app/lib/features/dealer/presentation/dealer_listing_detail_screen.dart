import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import '../controller/dealer_controller.dart';

class DealerListingDetailScreen extends ConsumerStatefulWidget {
  final String listingId;
  const DealerListingDetailScreen({super.key, required this.listingId});

  @override
  ConsumerState<DealerListingDetailScreen> createState() => _DealerListingDetailScreenState();
}

class _DealerListingDetailScreenState extends ConsumerState<DealerListingDetailScreen> {
  final _amountController = TextEditingController();
  final _msgController = TextEditingController();
  final _timingController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _msgController.dispose();
    _timingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dealerControllerProvider);

    ref.listen<AsyncValue<void>>(dealerControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.error.toString(), style: const TextStyle(color: Colors.white)), backgroundColor: AppColors.error));
      } else if (!next.isLoading && previous?.isLoading == true) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Quote submitted!'), backgroundColor: AppColors.success));
        context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Quote'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Lead Summary Mock
            Card(
              color: AppColors.surface,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Industrial Aluminum Scrap', style: AppTypography.titleLarge),
                    const SizedBox(height: 8),
                    Text('Quantity: 50 kg', style: AppTypography.titleMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Your Offer', style: AppTypography.titleMedium),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Total Price Amount', prefixText: '\$'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _timingController,
              decoration: const InputDecoration(labelText: 'Expected Pickup Timing (e.g. Tomorrow 2PM)'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _msgController,
              decoration: const InputDecoration(labelText: 'Message / Notes'),
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: state.isLoading ? null : () {
                final amount = double.tryParse(_amountController.text) ?? 0.0;
                if (amount <= 0) return;
                ref.read(dealerControllerProvider.notifier).submitQuote(
                  listingId: widget.listingId,
                  amount: amount,
                  message: _msgController.text,
                  expectedPickupTiming: _timingController.text,
                );
              },
              child: state.isLoading 
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Send Quote to Seller'),
            ),
          ],
        ),
      ),
    );
  }
}
