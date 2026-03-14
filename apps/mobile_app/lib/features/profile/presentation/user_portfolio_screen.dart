import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:domain_models/domain_models.dart';
import 'package:data_layer/data_layer.dart';

class UserPortfolioScreen extends ConsumerWidget {
  final String userId;
  const UserPortfolioScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Portfolio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Implement edit profile
            },
          ),
        ],
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (profile) {
          if (profile == null) return const Center(child: Text('Profile not found'));

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(profile),
                const SizedBox(height: 32),
                _buildStats(profile),
                const SizedBox(height: 32),
                _buildInfoSection('About', profile.description ?? 'No description provided.'),
                const SizedBox(height: 24),
                if (profile.role == UserRole.dealer) ...[
                  _buildBusinessDetails(profile),
                  const SizedBox(height: 24),
                ],
                _buildContactInfo(profile),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(UserProfile profile) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.primaryLight.withValues(alpha: 0.2),
          backgroundImage: profile.profileImageUrl != null ? NetworkImage(profile.profileImageUrl!) : null,
          child: profile.profileImageUrl == null
              ? const Icon(Icons.person, size: 50, color: AppColors.primary)
              : null,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(profile.name, style: AppTypography.headlineMedium),
                  if (profile.isVerified) ...[
                    const SizedBox(width: 8),
                    const Icon(Icons.verified, color: AppColors.primary, size: 20),
                  ],
                ],
              ),
              Text(profile.role == UserRole.dealer ? 'Verified Dealer' : 'Seller', 
                style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary)),
              if (profile.businessName != null) ...[
                const SizedBox(height: 4),
                Text(profile.businessName!, style: AppTypography.titleMedium.copyWith(color: AppColors.primary)),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStats(UserProfile profile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Rating', '${profile.rating}', Icons.star),
          _buildStatItem('Joined', _formatDate(profile.registrationDate), Icons.calendar_today),
          if (profile.role == UserRole.dealer)
            _buildStatItem('Areas', '${profile.serviceArea.length}', Icons.map),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(value, style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.bold)),
        Text(label, style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.titleLarge),
        const SizedBox(height: 12),
        Text(content, style: AppTypography.bodyMedium),
      ],
    );
  }

  Widget _buildBusinessDetails(UserProfile profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Business Details', style: AppTypography.titleLarge),
        const SizedBox(height: 12),
        _buildDetailRow('GST Number', profile.gstNumber ?? 'N/A'),
        _buildDetailRow('Address', profile.businessAddress ?? 'N/A'),
      ],
    );
  }

  Widget _buildContactInfo(UserProfile profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Settings', style: AppTypography.titleLarge),
        const SizedBox(height: 12),
        _buildDetailRow('Email', profile.email ?? 'N/A'),
        _buildDetailRow('Phone', profile.phone),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary)),
          Text(value, style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }
}

// Provider for user profile
final profileProvider = StreamProvider.family<UserProfile?, String>((ref, uid) {
  return ref.watch(userRepositoryProvider).watchProfile(uid);
});
