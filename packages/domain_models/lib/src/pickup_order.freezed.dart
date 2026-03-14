// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PickupOrder {

 String get id; String get listingId; String get quoteId; String get sellerId; String get dealerId; PickupStatus get status; String? get scheduledTime; double? get actualWeight; double? get finalAmount; List<String> get otpTokens; DateTime? get createdAt;
/// Create a copy of PickupOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupOrderCopyWith<PickupOrder> get copyWith => _$PickupOrderCopyWithImpl<PickupOrder>(this as PickupOrder, _$identity);

  /// Serializes this PickupOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.quoteId, quoteId) || other.quoteId == quoteId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.dealerId, dealerId) || other.dealerId == dealerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.actualWeight, actualWeight) || other.actualWeight == actualWeight)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&const DeepCollectionEquality().equals(other.otpTokens, otpTokens)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listingId,quoteId,sellerId,dealerId,status,scheduledTime,actualWeight,finalAmount,const DeepCollectionEquality().hash(otpTokens),createdAt);

@override
String toString() {
  return 'PickupOrder(id: $id, listingId: $listingId, quoteId: $quoteId, sellerId: $sellerId, dealerId: $dealerId, status: $status, scheduledTime: $scheduledTime, actualWeight: $actualWeight, finalAmount: $finalAmount, otpTokens: $otpTokens, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PickupOrderCopyWith<$Res>  {
  factory $PickupOrderCopyWith(PickupOrder value, $Res Function(PickupOrder) _then) = _$PickupOrderCopyWithImpl;
@useResult
$Res call({
 String id, String listingId, String quoteId, String sellerId, String dealerId, PickupStatus status, String? scheduledTime, double? actualWeight, double? finalAmount, List<String> otpTokens, DateTime? createdAt
});




}
/// @nodoc
class _$PickupOrderCopyWithImpl<$Res>
    implements $PickupOrderCopyWith<$Res> {
  _$PickupOrderCopyWithImpl(this._self, this._then);

  final PickupOrder _self;
  final $Res Function(PickupOrder) _then;

/// Create a copy of PickupOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? listingId = null,Object? quoteId = null,Object? sellerId = null,Object? dealerId = null,Object? status = null,Object? scheduledTime = freezed,Object? actualWeight = freezed,Object? finalAmount = freezed,Object? otpTokens = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,quoteId: null == quoteId ? _self.quoteId : quoteId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,dealerId: null == dealerId ? _self.dealerId : dealerId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PickupStatus,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String?,actualWeight: freezed == actualWeight ? _self.actualWeight : actualWeight // ignore: cast_nullable_to_non_nullable
as double?,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double?,otpTokens: null == otpTokens ? _self.otpTokens : otpTokens // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PickupOrder].
extension PickupOrderPatterns on PickupOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickupOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickupOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickupOrder value)  $default,){
final _that = this;
switch (_that) {
case _PickupOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickupOrder value)?  $default,){
final _that = this;
switch (_that) {
case _PickupOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String listingId,  String quoteId,  String sellerId,  String dealerId,  PickupStatus status,  String? scheduledTime,  double? actualWeight,  double? finalAmount,  List<String> otpTokens,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickupOrder() when $default != null:
return $default(_that.id,_that.listingId,_that.quoteId,_that.sellerId,_that.dealerId,_that.status,_that.scheduledTime,_that.actualWeight,_that.finalAmount,_that.otpTokens,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String listingId,  String quoteId,  String sellerId,  String dealerId,  PickupStatus status,  String? scheduledTime,  double? actualWeight,  double? finalAmount,  List<String> otpTokens,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PickupOrder():
return $default(_that.id,_that.listingId,_that.quoteId,_that.sellerId,_that.dealerId,_that.status,_that.scheduledTime,_that.actualWeight,_that.finalAmount,_that.otpTokens,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String listingId,  String quoteId,  String sellerId,  String dealerId,  PickupStatus status,  String? scheduledTime,  double? actualWeight,  double? finalAmount,  List<String> otpTokens,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PickupOrder() when $default != null:
return $default(_that.id,_that.listingId,_that.quoteId,_that.sellerId,_that.dealerId,_that.status,_that.scheduledTime,_that.actualWeight,_that.finalAmount,_that.otpTokens,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PickupOrder implements PickupOrder {
  const _PickupOrder({required this.id, required this.listingId, required this.quoteId, required this.sellerId, required this.dealerId, this.status = PickupStatus.awaitingSchedule, this.scheduledTime, this.actualWeight, this.finalAmount, final  List<String> otpTokens = const [], this.createdAt}): _otpTokens = otpTokens;
  factory _PickupOrder.fromJson(Map<String, dynamic> json) => _$PickupOrderFromJson(json);

@override final  String id;
@override final  String listingId;
@override final  String quoteId;
@override final  String sellerId;
@override final  String dealerId;
@override@JsonKey() final  PickupStatus status;
@override final  String? scheduledTime;
@override final  double? actualWeight;
@override final  double? finalAmount;
 final  List<String> _otpTokens;
@override@JsonKey() List<String> get otpTokens {
  if (_otpTokens is EqualUnmodifiableListView) return _otpTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_otpTokens);
}

@override final  DateTime? createdAt;

/// Create a copy of PickupOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupOrderCopyWith<_PickupOrder> get copyWith => __$PickupOrderCopyWithImpl<_PickupOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickupOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.quoteId, quoteId) || other.quoteId == quoteId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.dealerId, dealerId) || other.dealerId == dealerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.actualWeight, actualWeight) || other.actualWeight == actualWeight)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&const DeepCollectionEquality().equals(other._otpTokens, _otpTokens)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listingId,quoteId,sellerId,dealerId,status,scheduledTime,actualWeight,finalAmount,const DeepCollectionEquality().hash(_otpTokens),createdAt);

@override
String toString() {
  return 'PickupOrder(id: $id, listingId: $listingId, quoteId: $quoteId, sellerId: $sellerId, dealerId: $dealerId, status: $status, scheduledTime: $scheduledTime, actualWeight: $actualWeight, finalAmount: $finalAmount, otpTokens: $otpTokens, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PickupOrderCopyWith<$Res> implements $PickupOrderCopyWith<$Res> {
  factory _$PickupOrderCopyWith(_PickupOrder value, $Res Function(_PickupOrder) _then) = __$PickupOrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String listingId, String quoteId, String sellerId, String dealerId, PickupStatus status, String? scheduledTime, double? actualWeight, double? finalAmount, List<String> otpTokens, DateTime? createdAt
});




}
/// @nodoc
class __$PickupOrderCopyWithImpl<$Res>
    implements _$PickupOrderCopyWith<$Res> {
  __$PickupOrderCopyWithImpl(this._self, this._then);

  final _PickupOrder _self;
  final $Res Function(_PickupOrder) _then;

/// Create a copy of PickupOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? listingId = null,Object? quoteId = null,Object? sellerId = null,Object? dealerId = null,Object? status = null,Object? scheduledTime = freezed,Object? actualWeight = freezed,Object? finalAmount = freezed,Object? otpTokens = null,Object? createdAt = freezed,}) {
  return _then(_PickupOrder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,quoteId: null == quoteId ? _self.quoteId : quoteId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,dealerId: null == dealerId ? _self.dealerId : dealerId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PickupStatus,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String?,actualWeight: freezed == actualWeight ? _self.actualWeight : actualWeight // ignore: cast_nullable_to_non_nullable
as double?,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double?,otpTokens: null == otpTokens ? _self._otpTokens : otpTokens // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
