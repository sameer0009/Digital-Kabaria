// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Rating {

 String get id; String get pickupOrderId; String get fromUserId; String get toUserId; double get score; String? get review; DateTime get createdAt;
/// Create a copy of Rating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingCopyWith<Rating> get copyWith => _$RatingCopyWithImpl<Rating>(this as Rating, _$identity);

  /// Serializes this Rating to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rating&&(identical(other.id, id) || other.id == id)&&(identical(other.pickupOrderId, pickupOrderId) || other.pickupOrderId == pickupOrderId)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId)&&(identical(other.toUserId, toUserId) || other.toUserId == toUserId)&&(identical(other.score, score) || other.score == score)&&(identical(other.review, review) || other.review == review)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pickupOrderId,fromUserId,toUserId,score,review,createdAt);

@override
String toString() {
  return 'Rating(id: $id, pickupOrderId: $pickupOrderId, fromUserId: $fromUserId, toUserId: $toUserId, score: $score, review: $review, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RatingCopyWith<$Res>  {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) _then) = _$RatingCopyWithImpl;
@useResult
$Res call({
 String id, String pickupOrderId, String fromUserId, String toUserId, double score, String? review, DateTime createdAt
});




}
/// @nodoc
class _$RatingCopyWithImpl<$Res>
    implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._self, this._then);

  final Rating _self;
  final $Res Function(Rating) _then;

/// Create a copy of Rating
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pickupOrderId = null,Object? fromUserId = null,Object? toUserId = null,Object? score = null,Object? review = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pickupOrderId: null == pickupOrderId ? _self.pickupOrderId : pickupOrderId // ignore: cast_nullable_to_non_nullable
as String,fromUserId: null == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String,toUserId: null == toUserId ? _self.toUserId : toUserId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Rating].
extension RatingPatterns on Rating {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Rating value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Rating() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Rating value)  $default,){
final _that = this;
switch (_that) {
case _Rating():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Rating value)?  $default,){
final _that = this;
switch (_that) {
case _Rating() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pickupOrderId,  String fromUserId,  String toUserId,  double score,  String? review,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Rating() when $default != null:
return $default(_that.id,_that.pickupOrderId,_that.fromUserId,_that.toUserId,_that.score,_that.review,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pickupOrderId,  String fromUserId,  String toUserId,  double score,  String? review,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Rating():
return $default(_that.id,_that.pickupOrderId,_that.fromUserId,_that.toUserId,_that.score,_that.review,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pickupOrderId,  String fromUserId,  String toUserId,  double score,  String? review,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Rating() when $default != null:
return $default(_that.id,_that.pickupOrderId,_that.fromUserId,_that.toUserId,_that.score,_that.review,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Rating implements Rating {
  const _Rating({required this.id, required this.pickupOrderId, required this.fromUserId, required this.toUserId, required this.score, this.review, required this.createdAt});
  factory _Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

@override final  String id;
@override final  String pickupOrderId;
@override final  String fromUserId;
@override final  String toUserId;
@override final  double score;
@override final  String? review;
@override final  DateTime createdAt;

/// Create a copy of Rating
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingCopyWith<_Rating> get copyWith => __$RatingCopyWithImpl<_Rating>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rating&&(identical(other.id, id) || other.id == id)&&(identical(other.pickupOrderId, pickupOrderId) || other.pickupOrderId == pickupOrderId)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId)&&(identical(other.toUserId, toUserId) || other.toUserId == toUserId)&&(identical(other.score, score) || other.score == score)&&(identical(other.review, review) || other.review == review)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pickupOrderId,fromUserId,toUserId,score,review,createdAt);

@override
String toString() {
  return 'Rating(id: $id, pickupOrderId: $pickupOrderId, fromUserId: $fromUserId, toUserId: $toUserId, score: $score, review: $review, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RatingCopyWith<$Res> implements $RatingCopyWith<$Res> {
  factory _$RatingCopyWith(_Rating value, $Res Function(_Rating) _then) = __$RatingCopyWithImpl;
@override @useResult
$Res call({
 String id, String pickupOrderId, String fromUserId, String toUserId, double score, String? review, DateTime createdAt
});




}
/// @nodoc
class __$RatingCopyWithImpl<$Res>
    implements _$RatingCopyWith<$Res> {
  __$RatingCopyWithImpl(this._self, this._then);

  final _Rating _self;
  final $Res Function(_Rating) _then;

/// Create a copy of Rating
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pickupOrderId = null,Object? fromUserId = null,Object? toUserId = null,Object? score = null,Object? review = freezed,Object? createdAt = null,}) {
  return _then(_Rating(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pickupOrderId: null == pickupOrderId ? _self.pickupOrderId : pickupOrderId // ignore: cast_nullable_to_non_nullable
as String,fromUserId: null == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String,toUserId: null == toUserId ? _self.toUserId : toUserId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
