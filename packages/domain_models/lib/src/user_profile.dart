import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

enum UserRole { seller, dealer, admin }

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required UserRole role,
    required String name,
    required String phone,
    String? email,
    @Default(false) bool isVerified,
    String? businessName,
    @Default(0.0) double rating,
    @Default([]) List<String> serviceArea, // Cities/Areas for dealer
    @Default([]) List<String> categoriesHandled, // For dealer
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}
