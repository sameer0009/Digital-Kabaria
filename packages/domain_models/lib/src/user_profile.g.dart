// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  uid: json['uid'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  name: json['name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  isVerified: json['isVerified'] as bool? ?? false,
  businessName: json['businessName'] as String?,
  rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
  serviceArea:
      (json['serviceArea'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  categoriesHandled:
      (json['categoriesHandled'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'role': _$UserRoleEnumMap[instance.role]!,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'isVerified': instance.isVerified,
      'businessName': instance.businessName,
      'rating': instance.rating,
      'serviceArea': instance.serviceArea,
      'categoriesHandled': instance.categoriesHandled,
    };

const _$UserRoleEnumMap = {
  UserRole.seller: 'seller',
  UserRole.dealer: 'dealer',
  UserRole.admin: 'admin',
};
