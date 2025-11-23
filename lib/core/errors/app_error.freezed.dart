// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppError {

 String get message;
/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppErrorCopyWith<AppError> get copyWith => _$AppErrorCopyWithImpl<AppError>(this as AppError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AppErrorCopyWith<$Res>  {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) _then) = _$AppErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AppErrorCopyWithImpl<$Res>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._self, this._then);

  final AppError _self;
  final $Res Function(AppError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppError].
extension AppErrorPatterns on AppError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkError value)?  network,TResult Function( ServerError value)?  server,TResult Function( LocationError value)?  location,TResult Function( PermissionError value)?  permission,TResult Function( CacheError value)?  cache,TResult Function( UnknownError value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkError() when network != null:
return network(_that);case ServerError() when server != null:
return server(_that);case LocationError() when location != null:
return location(_that);case PermissionError() when permission != null:
return permission(_that);case CacheError() when cache != null:
return cache(_that);case UnknownError() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkError value)  network,required TResult Function( ServerError value)  server,required TResult Function( LocationError value)  location,required TResult Function( PermissionError value)  permission,required TResult Function( CacheError value)  cache,required TResult Function( UnknownError value)  unknown,}){
final _that = this;
switch (_that) {
case NetworkError():
return network(_that);case ServerError():
return server(_that);case LocationError():
return location(_that);case PermissionError():
return permission(_that);case CacheError():
return cache(_that);case UnknownError():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkError value)?  network,TResult? Function( ServerError value)?  server,TResult? Function( LocationError value)?  location,TResult? Function( PermissionError value)?  permission,TResult? Function( CacheError value)?  cache,TResult? Function( UnknownError value)?  unknown,}){
final _that = this;
switch (_that) {
case NetworkError() when network != null:
return network(_that);case ServerError() when server != null:
return server(_that);case LocationError() when location != null:
return location(_that);case PermissionError() when permission != null:
return permission(_that);case CacheError() when cache != null:
return cache(_that);case UnknownError() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  network,TResult Function( String message)?  server,TResult Function( String message)?  location,TResult Function( String message)?  permission,TResult Function( String message)?  cache,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkError() when network != null:
return network(_that.message);case ServerError() when server != null:
return server(_that.message);case LocationError() when location != null:
return location(_that.message);case PermissionError() when permission != null:
return permission(_that.message);case CacheError() when cache != null:
return cache(_that.message);case UnknownError() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  network,required TResult Function( String message)  server,required TResult Function( String message)  location,required TResult Function( String message)  permission,required TResult Function( String message)  cache,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case NetworkError():
return network(_that.message);case ServerError():
return server(_that.message);case LocationError():
return location(_that.message);case PermissionError():
return permission(_that.message);case CacheError():
return cache(_that.message);case UnknownError():
return unknown(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  network,TResult? Function( String message)?  server,TResult? Function( String message)?  location,TResult? Function( String message)?  permission,TResult? Function( String message)?  cache,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case NetworkError() when network != null:
return network(_that.message);case ServerError() when server != null:
return server(_that.message);case LocationError() when location != null:
return location(_that.message);case PermissionError() when permission != null:
return permission(_that.message);case CacheError() when cache != null:
return cache(_that.message);case UnknownError() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NetworkError implements AppError {
  const NetworkError(this.message);
  

@override final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkErrorCopyWith<NetworkError> get copyWith => _$NetworkErrorCopyWithImpl<NetworkError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.network(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(NetworkError value, $Res Function(NetworkError) _then) = _$NetworkErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(this._self, this._then);

  final NetworkError _self;
  final $Res Function(NetworkError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NetworkError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServerError implements AppError {
  const ServerError(this.message);
  

@override final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorCopyWith<ServerError> get copyWith => _$ServerErrorCopyWithImpl<ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.server(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(ServerError value, $Res Function(ServerError) _then) = _$ServerErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._self, this._then);

  final ServerError _self;
  final $Res Function(ServerError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LocationError implements AppError {
  const LocationError(this.message);
  

@override final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationErrorCopyWith<LocationError> get copyWith => _$LocationErrorCopyWithImpl<LocationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.location(message: $message)';
}


}

/// @nodoc
abstract mixin class $LocationErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $LocationErrorCopyWith(LocationError value, $Res Function(LocationError) _then) = _$LocationErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LocationErrorCopyWithImpl<$Res>
    implements $LocationErrorCopyWith<$Res> {
  _$LocationErrorCopyWithImpl(this._self, this._then);

  final LocationError _self;
  final $Res Function(LocationError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LocationError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PermissionError implements AppError {
  const PermissionError(this.message);
  

@override final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionErrorCopyWith<PermissionError> get copyWith => _$PermissionErrorCopyWithImpl<PermissionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.permission(message: $message)';
}


}

/// @nodoc
abstract mixin class $PermissionErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $PermissionErrorCopyWith(PermissionError value, $Res Function(PermissionError) _then) = _$PermissionErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PermissionErrorCopyWithImpl<$Res>
    implements $PermissionErrorCopyWith<$Res> {
  _$PermissionErrorCopyWithImpl(this._self, this._then);

  final PermissionError _self;
  final $Res Function(PermissionError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PermissionError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CacheError implements AppError {
  const CacheError(this.message);
  

@override final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheErrorCopyWith<CacheError> get copyWith => _$CacheErrorCopyWithImpl<CacheError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.cache(message: $message)';
}


}

/// @nodoc
abstract mixin class $CacheErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $CacheErrorCopyWith(CacheError value, $Res Function(CacheError) _then) = _$CacheErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CacheErrorCopyWithImpl<$Res>
    implements $CacheErrorCopyWith<$Res> {
  _$CacheErrorCopyWithImpl(this._self, this._then);

  final CacheError _self;
  final $Res Function(CacheError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CacheError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnknownError implements AppError {
  const UnknownError(this.message);
  

@override final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownErrorCopyWith<UnknownError> get copyWith => _$UnknownErrorCopyWithImpl<UnknownError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnknownErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $UnknownErrorCopyWith(UnknownError value, $Res Function(UnknownError) _then) = _$UnknownErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnknownErrorCopyWithImpl<$Res>
    implements $UnknownErrorCopyWith<$Res> {
  _$UnknownErrorCopyWithImpl(this._self, this._then);

  final UnknownError _self;
  final $Res Function(UnknownError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnknownError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
