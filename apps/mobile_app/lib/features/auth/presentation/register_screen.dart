import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:shared_core/shared_core.dart';
import 'package:go_router/go_router.dart';
import 'package:domain_models/domain_models.dart';
import '../controller/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _gstController = TextEditingController();
  final _addressController = TextEditingController();
  UserRole _selectedRole = UserRole.seller;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _businessNameController.dispose();
    _gstController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    ref.listen<AsyncValue<void>>(authControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.error.toString(), style: const TextStyle(color: Colors.white)), backgroundColor: AppColors.error));
      }
    });
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Create Account', style: AppTypography.headlineLarge.copyWith(color: AppColors.primary), textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text('Join Digital Kabaria today', style: AppTypography.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: 32),
              const Text('Register As', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('Seller'),
                    selected: _selectedRole == UserRole.seller,
                    onSelected: (val) => setState(() => _selectedRole = UserRole.seller),
                  ),
                  const SizedBox(width: 12),
                  ChoiceChip(
                    label: const Text('Dealer (B2B)'),
                    selected: _selectedRole == UserRole.dealer,
                    onSelected: (val) => setState(() => _selectedRole = UserRole.dealer),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name', hintText: 'Enter your name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email', hintText: 'Enter your email'),
                keyboardType: TextInputType.emailAddress,
              ),
              if (_selectedRole == UserRole.dealer) ...[
                const SizedBox(height: 16),
                TextField(
                  controller: _businessNameController,
                  decoration: const InputDecoration(labelText: 'Business Name', hintText: 'e.g. Green Scrap Solutions'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _gstController,
                  decoration: const InputDecoration(labelText: 'GST Number', hintText: '22AAAAA0000A1Z5'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Business Address', hintText: 'Street, City, Zip'),
                  maxLines: 2,
                ),
              ],
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password', hintText: 'Create a password (min 6 chars)'),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: authState.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        await ref.read(authControllerProvider.notifier).register(
                              email: _emailController.text.trim(),
                              password: _passwordController.text,
                              name: _nameController.text.trim(),
                              role: _selectedRole,
                              businessName: _selectedRole == UserRole.dealer ? _businessNameController.text.trim() : null,
                              gstNumber: _selectedRole == UserRole.dealer ? _gstController.text.trim() : null,
                              businessAddress: _selectedRole == UserRole.dealer ? _addressController.text.trim() : null,
                            );
                      },
                child: authState.isLoading 
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
                    : const Text('Register', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go(AppRoutes.login),
                child: const Text('Already have an account? Login', style: TextStyle(color: AppColors.textSecondary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
