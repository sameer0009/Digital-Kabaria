import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import '../controller/listing_controller.dart';

class SellerCreateListingScreen extends ConsumerStatefulWidget {
  const SellerCreateListingScreen({super.key});

  @override
  ConsumerState<SellerCreateListingScreen> createState() => _SellerCreateListingScreenState();
}

class _SellerCreateListingScreenState extends ConsumerState<SellerCreateListingScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  
  // Form fields
  String? _categoryId;
  String? _title;
  String? _description;
  double? _quantity;
  String _unit = 'kg';
  // List<File> _images = []; // MVP stub

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Scrap Request'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() => _currentStep += 1);
            } else {
              // Submit
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                
                ref.read(listingControllerProvider.notifier).createListing(
                  title: _title ?? '',
                  description: _description ?? '',
                  categoryId: _categoryId ?? 'cat_paper',
                  quantity: _quantity ?? 0.0,
                  unit: _unit,
                ).then((_) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Listing submitted globally!'), backgroundColor: AppColors.success));
                  context.pop();
                });
              }
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep -= 1);
            } else {
              context.pop();
            }
          },
          steps: [
            Step(
              title: const Text('Category'),
              isActive: _currentStep >= 0,
              content: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Select Category'),
                    initialValue: _categoryId,
                    items: const [
                      DropdownMenuItem(value: 'cat_paper', child: Text('Paper & Cardboard')),
                      DropdownMenuItem(value: 'cat_plastic', child: Text('Plastic')),
                      DropdownMenuItem(value: 'cat_metal', child: Text('Metal')),
                      DropdownMenuItem(value: 'cat_ewaste', child: Text('E-Waste')),
                    ],
                    onChanged: (val) => setState(() => _categoryId = val),
                    validator: (val) => val == null ? 'Required' : null,
                  ),
                ],
              ),
            ),
            Step(
              title: const Text('Details'),
              isActive: _currentStep >= 1,
              content: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Title', hintText: 'e.g., Old washing machine'),
                    onSaved: (val) => _title = val,
                    validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Description', hintText: 'Condition, brand, etc.'),
                    maxLines: 3,
                    onSaved: (val) => _description = val,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'Est. Quantity'),
                          keyboardType: TextInputType.number,
                          onSaved: (val) => _quantity = double.tryParse(val ?? '0'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(labelText: 'Unit'),
                          initialValue: _unit,
                          items: const [
                            DropdownMenuItem(value: 'kg', child: Text('kg')),
                            DropdownMenuItem(value: 'piece', child: Text('piece')),
                            DropdownMenuItem(value: 'ton', child: Text('ton')),
                          ],
                          onChanged: (val) => setState(() => _unit = val ?? 'kg'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Step(
              title: const Text('Photos'),
              isActive: _currentStep >= 2,
              content: Column(
                children: [
                  const Text('Upload photos of your scrap so dealers can bid accurately.', style: TextStyle(color: AppColors.textSecondary)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Stub
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image picker stub')));
                    },
                    icon: const Icon(Icons.add_a_photo),
                    label: const Text('Add Photos'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
