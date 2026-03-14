// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scrap_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScrapCategory {

 String get id; String get name; String? get description; String get unit;// kg, ton, piece, lot
 int get sortOrder; bool get active; String? get iconUrl;
/// Create a copy of ScrapCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapCategoryCopyWith<ScrapCategory> get copyWith => _$ScrapCategoryCopyWithImpl<ScrapCategory>(this as ScrapCategory, _$identity);

  /// Serializes this ScrapCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrapCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.active, active) || other.active == active)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,unit,sortOrder,active,iconUrl);

@override
String toString() {
  return 'ScrapCategory(id: $id, name: $name, description: $description, unit: $unit, sortOrder: $sortOrder, active: $active, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $ScrapCategoryCopyWith<$Res>  {
  factory $ScrapCategoryCopyWith(ScrapCategory value, $Res Function(ScrapCategory) _then) = _$ScrapCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String unit, int sortOrder, bool active, String? iconUrl
});




}
/// @nodoc
class _$ScrapCategoryCopyWithImpl<$Res>
    implements $ScrapCategoryCopyWith<$Res> {
  _$ScrapCategoryCopyWithImpl(this._self, this._then);

  final ScrapCategory _self;
  final $Res Function(ScrapCategory) _then;

/// Create a copy of ScrapCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? unit = null,Object? sortOrder = null,Object? active = null,Object? iconUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScrapCategory].
extension ScrapCategoryPatterns on ScrapCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScrapCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScrapCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScrapCategory value)  $default,){
final _that = this;
switch (_that) {
case _ScrapCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScrapCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ScrapCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String unit,  int sortOrder,  bool active,  String? iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScrapCategory() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.unit,_that.sortOrder,_that.active,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String unit,  int sortOrder,  bool active,  String? iconUrl)  $default,) {final _that = this;
switch (_that) {
case _ScrapCategory():
return $default(_that.id,_that.name,_that.description,_that.unit,_that.sortOrder,_that.active,_that.iconUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String unit,  int sortOrder,  bool active,  String? iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _ScrapCategory() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.unit,_that.sortOrder,_that.active,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScrapCategory implements ScrapCategory {
  const _ScrapCategory({required this.id, required this.name, this.description, required this.unit, this.sortOrder = 0, this.active = true, this.iconUrl});
  factory _ScrapCategory.fromJson(Map<String, dynamic> json) => _$ScrapCategoryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String unit;
// kg, ton, piece, lot
@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  bool active;
@override final  String? iconUrl;

/// Create a copy of ScrapCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapCategoryCopyWith<_ScrapCategory> get copyWith => __$ScrapCategoryCopyWithImpl<_ScrapCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScrapCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.active, active) || other.active == active)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,unit,sortOrder,active,iconUrl);

@override
String toString() {
  return 'ScrapCategory(id: $id, name: $name, description: $description, unit: $unit, sortOrder: $sortOrder, active: $active, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$ScrapCategoryCopyWith<$Res> implements $ScrapCategoryCopyWith<$Res> {
  factory _$ScrapCategoryCopyWith(_ScrapCategory value, $Res Function(_ScrapCategory) _then) = __$ScrapCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String unit, int sortOrder, bool active, String? iconUrl
});




}
/// @nodoc
class __$ScrapCategoryCopyWithImpl<$Res>
    implements _$ScrapCategoryCopyWith<$Res> {
  __$ScrapCategoryCopyWithImpl(this._self, this._then);

  final _ScrapCategory _self;
  final $Res Function(_ScrapCategory) _then;

/// Create a copy of ScrapCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? unit = null,Object? sortOrder = null,Object? active = null,Object? iconUrl = freezed,}) {
  return _then(_ScrapCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ScrapSubcategory {

 String get id; String get parentId; String get name; String get unit; bool get active;
/// Create a copy of ScrapSubcategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapSubcategoryCopyWith<ScrapSubcategory> get copyWith => _$ScrapSubcategoryCopyWithImpl<ScrapSubcategory>(this as ScrapSubcategory, _$identity);

  /// Serializes this ScrapSubcategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrapSubcategory&&(identical(other.id, id) || other.id == id)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,parentId,name,unit,active);

@override
String toString() {
  return 'ScrapSubcategory(id: $id, parentId: $parentId, name: $name, unit: $unit, active: $active)';
}


}

/// @nodoc
abstract mixin class $ScrapSubcategoryCopyWith<$Res>  {
  factory $ScrapSubcategoryCopyWith(ScrapSubcategory value, $Res Function(ScrapSubcategory) _then) = _$ScrapSubcategoryCopyWithImpl;
@useResult
$Res call({
 String id, String parentId, String name, String unit, bool active
});




}
/// @nodoc
class _$ScrapSubcategoryCopyWithImpl<$Res>
    implements $ScrapSubcategoryCopyWith<$Res> {
  _$ScrapSubcategoryCopyWithImpl(this._self, this._then);

  final ScrapSubcategory _self;
  final $Res Function(ScrapSubcategory) _then;

/// Create a copy of ScrapSubcategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? parentId = null,Object? name = null,Object? unit = null,Object? active = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ScrapSubcategory].
extension ScrapSubcategoryPatterns on ScrapSubcategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScrapSubcategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScrapSubcategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScrapSubcategory value)  $default,){
final _that = this;
switch (_that) {
case _ScrapSubcategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScrapSubcategory value)?  $default,){
final _that = this;
switch (_that) {
case _ScrapSubcategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String parentId,  String name,  String unit,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScrapSubcategory() when $default != null:
return $default(_that.id,_that.parentId,_that.name,_that.unit,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String parentId,  String name,  String unit,  bool active)  $default,) {final _that = this;
switch (_that) {
case _ScrapSubcategory():
return $default(_that.id,_that.parentId,_that.name,_that.unit,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String parentId,  String name,  String unit,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _ScrapSubcategory() when $default != null:
return $default(_that.id,_that.parentId,_that.name,_that.unit,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScrapSubcategory implements ScrapSubcategory {
  const _ScrapSubcategory({required this.id, required this.parentId, required this.name, required this.unit, this.active = true});
  factory _ScrapSubcategory.fromJson(Map<String, dynamic> json) => _$ScrapSubcategoryFromJson(json);

@override final  String id;
@override final  String parentId;
@override final  String name;
@override final  String unit;
@override@JsonKey() final  bool active;

/// Create a copy of ScrapSubcategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapSubcategoryCopyWith<_ScrapSubcategory> get copyWith => __$ScrapSubcategoryCopyWithImpl<_ScrapSubcategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapSubcategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScrapSubcategory&&(identical(other.id, id) || other.id == id)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,parentId,name,unit,active);

@override
String toString() {
  return 'ScrapSubcategory(id: $id, parentId: $parentId, name: $name, unit: $unit, active: $active)';
}


}

/// @nodoc
abstract mixin class _$ScrapSubcategoryCopyWith<$Res> implements $ScrapSubcategoryCopyWith<$Res> {
  factory _$ScrapSubcategoryCopyWith(_ScrapSubcategory value, $Res Function(_ScrapSubcategory) _then) = __$ScrapSubcategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String parentId, String name, String unit, bool active
});




}
/// @nodoc
class __$ScrapSubcategoryCopyWithImpl<$Res>
    implements _$ScrapSubcategoryCopyWith<$Res> {
  __$ScrapSubcategoryCopyWithImpl(this._self, this._then);

  final _ScrapSubcategory _self;
  final $Res Function(_ScrapSubcategory) _then;

/// Create a copy of ScrapSubcategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? parentId = null,Object? name = null,Object? unit = null,Object? active = null,}) {
  return _then(_ScrapSubcategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
