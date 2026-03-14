// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get uid; UserRole get role; String get name; String get phone; String? get email; bool get isVerified; String? get businessName; String? get gstNumber; String? get businessAddress; String? get description; String? get profileImageUrl; DateTime? get registrationDate; double get rating; List<String> get serviceArea;// Cities/Areas for dealer
 List<String> get categoriesHandled;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.gstNumber, gstNumber) || other.gstNumber == gstNumber)&&(identical(other.businessAddress, businessAddress) || other.businessAddress == businessAddress)&&(identical(other.description, description) || other.description == description)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.registrationDate, registrationDate) || other.registrationDate == registrationDate)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.serviceArea, serviceArea)&&const DeepCollectionEquality().equals(other.categoriesHandled, categoriesHandled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,role,name,phone,email,isVerified,businessName,gstNumber,businessAddress,description,profileImageUrl,registrationDate,rating,const DeepCollectionEquality().hash(serviceArea),const DeepCollectionEquality().hash(categoriesHandled));

@override
String toString() {
  return 'UserProfile(uid: $uid, role: $role, name: $name, phone: $phone, email: $email, isVerified: $isVerified, businessName: $businessName, gstNumber: $gstNumber, businessAddress: $businessAddress, description: $description, profileImageUrl: $profileImageUrl, registrationDate: $registrationDate, rating: $rating, serviceArea: $serviceArea, categoriesHandled: $categoriesHandled)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String uid, UserRole role, String name, String phone, String? email, bool isVerified, String? businessName, String? gstNumber, String? businessAddress, String? description, String? profileImageUrl, DateTime? registrationDate, double rating, List<String> serviceArea, List<String> categoriesHandled
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? role = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? isVerified = null,Object? businessName = freezed,Object? gstNumber = freezed,Object? businessAddress = freezed,Object? description = freezed,Object? profileImageUrl = freezed,Object? registrationDate = freezed,Object? rating = null,Object? serviceArea = null,Object? categoriesHandled = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,businessName: freezed == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String?,gstNumber: freezed == gstNumber ? _self.gstNumber : gstNumber // ignore: cast_nullable_to_non_nullable
as String?,businessAddress: freezed == businessAddress ? _self.businessAddress : businessAddress // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,registrationDate: freezed == registrationDate ? _self.registrationDate : registrationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,serviceArea: null == serviceArea ? _self.serviceArea : serviceArea // ignore: cast_nullable_to_non_nullable
as List<String>,categoriesHandled: null == categoriesHandled ? _self.categoriesHandled : categoriesHandled // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  UserRole role,  String name,  String phone,  String? email,  bool isVerified,  String? businessName,  String? gstNumber,  String? businessAddress,  String? description,  String? profileImageUrl,  DateTime? registrationDate,  double rating,  List<String> serviceArea,  List<String> categoriesHandled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.role,_that.name,_that.phone,_that.email,_that.isVerified,_that.businessName,_that.gstNumber,_that.businessAddress,_that.description,_that.profileImageUrl,_that.registrationDate,_that.rating,_that.serviceArea,_that.categoriesHandled);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  UserRole role,  String name,  String phone,  String? email,  bool isVerified,  String? businessName,  String? gstNumber,  String? businessAddress,  String? description,  String? profileImageUrl,  DateTime? registrationDate,  double rating,  List<String> serviceArea,  List<String> categoriesHandled)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.uid,_that.role,_that.name,_that.phone,_that.email,_that.isVerified,_that.businessName,_that.gstNumber,_that.businessAddress,_that.description,_that.profileImageUrl,_that.registrationDate,_that.rating,_that.serviceArea,_that.categoriesHandled);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  UserRole role,  String name,  String phone,  String? email,  bool isVerified,  String? businessName,  String? gstNumber,  String? businessAddress,  String? description,  String? profileImageUrl,  DateTime? registrationDate,  double rating,  List<String> serviceArea,  List<String> categoriesHandled)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.role,_that.name,_that.phone,_that.email,_that.isVerified,_that.businessName,_that.gstNumber,_that.businessAddress,_that.description,_that.profileImageUrl,_that.registrationDate,_that.rating,_that.serviceArea,_that.categoriesHandled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.uid, required this.role, required this.name, required this.phone, this.email, this.isVerified = false, this.businessName, this.gstNumber, this.businessAddress, this.description, this.profileImageUrl, this.registrationDate, this.rating = 0.0, final  List<String> serviceArea = const [], final  List<String> categoriesHandled = const []}): _serviceArea = serviceArea,_categoriesHandled = categoriesHandled;
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String uid;
@override final  UserRole role;
@override final  String name;
@override final  String phone;
@override final  String? email;
@override@JsonKey() final  bool isVerified;
@override final  String? businessName;
@override final  String? gstNumber;
@override final  String? businessAddress;
@override final  String? description;
@override final  String? profileImageUrl;
@override final  DateTime? registrationDate;
@override@JsonKey() final  double rating;
 final  List<String> _serviceArea;
@override@JsonKey() List<String> get serviceArea {
  if (_serviceArea is EqualUnmodifiableListView) return _serviceArea;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceArea);
}

// Cities/Areas for dealer
 final  List<String> _categoriesHandled;
// Cities/Areas for dealer
@override@JsonKey() List<String> get categoriesHandled {
  if (_categoriesHandled is EqualUnmodifiableListView) return _categoriesHandled;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoriesHandled);
}


/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.gstNumber, gstNumber) || other.gstNumber == gstNumber)&&(identical(other.businessAddress, businessAddress) || other.businessAddress == businessAddress)&&(identical(other.description, description) || other.description == description)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.registrationDate, registrationDate) || other.registrationDate == registrationDate)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._serviceArea, _serviceArea)&&const DeepCollectionEquality().equals(other._categoriesHandled, _categoriesHandled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,role,name,phone,email,isVerified,businessName,gstNumber,businessAddress,description,profileImageUrl,registrationDate,rating,const DeepCollectionEquality().hash(_serviceArea),const DeepCollectionEquality().hash(_categoriesHandled));

@override
String toString() {
  return 'UserProfile(uid: $uid, role: $role, name: $name, phone: $phone, email: $email, isVerified: $isVerified, businessName: $businessName, gstNumber: $gstNumber, businessAddress: $businessAddress, description: $description, profileImageUrl: $profileImageUrl, registrationDate: $registrationDate, rating: $rating, serviceArea: $serviceArea, categoriesHandled: $categoriesHandled)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String uid, UserRole role, String name, String phone, String? email, bool isVerified, String? businessName, String? gstNumber, String? businessAddress, String? description, String? profileImageUrl, DateTime? registrationDate, double rating, List<String> serviceArea, List<String> categoriesHandled
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? role = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? isVerified = null,Object? businessName = freezed,Object? gstNumber = freezed,Object? businessAddress = freezed,Object? description = freezed,Object? profileImageUrl = freezed,Object? registrationDate = freezed,Object? rating = null,Object? serviceArea = null,Object? categoriesHandled = null,}) {
  return _then(_UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,businessName: freezed == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String?,gstNumber: freezed == gstNumber ? _self.gstNumber : gstNumber // ignore: cast_nullable_to_non_nullable
as String?,businessAddress: freezed == businessAddress ? _self.businessAddress : businessAddress // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,registrationDate: freezed == registrationDate ? _self.registrationDate : registrationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,serviceArea: null == serviceArea ? _self._serviceArea : serviceArea // ignore: cast_nullable_to_non_nullable
as List<String>,categoriesHandled: null == categoriesHandled ? _self._categoriesHandled : categoriesHandled // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
