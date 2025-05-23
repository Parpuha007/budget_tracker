// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddTransactionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddTransactionLoading value) loading,
    required TResult Function(AddTransactionError value) error,
    required TResult Function(AddTransactionSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddTransactionLoading value)? loading,
    TResult? Function(AddTransactionError value)? error,
    TResult? Function(AddTransactionSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddTransactionLoading value)? loading,
    TResult Function(AddTransactionError value)? error,
    TResult Function(AddTransactionSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTransactionStateCopyWith<$Res> {
  factory $AddTransactionStateCopyWith(
          AddTransactionState value, $Res Function(AddTransactionState) then) =
      _$AddTransactionStateCopyWithImpl<$Res, AddTransactionState>;
}

/// @nodoc
class _$AddTransactionStateCopyWithImpl<$Res, $Val extends AddTransactionState>
    implements $AddTransactionStateCopyWith<$Res> {
  _$AddTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AddTransactionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AddTransactionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddTransactionLoading value) loading,
    required TResult Function(AddTransactionError value) error,
    required TResult Function(AddTransactionSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddTransactionLoading value)? loading,
    TResult? Function(AddTransactionError value)? error,
    TResult? Function(AddTransactionSuccess value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddTransactionLoading value)? loading,
    TResult Function(AddTransactionError value)? error,
    TResult Function(AddTransactionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddTransactionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddTransactionLoadingImplCopyWith<$Res> {
  factory _$$AddTransactionLoadingImplCopyWith(
          _$AddTransactionLoadingImpl value,
          $Res Function(_$AddTransactionLoadingImpl) then) =
      __$$AddTransactionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddTransactionLoadingImplCopyWithImpl<$Res>
    extends _$AddTransactionStateCopyWithImpl<$Res, _$AddTransactionLoadingImpl>
    implements _$$AddTransactionLoadingImplCopyWith<$Res> {
  __$$AddTransactionLoadingImplCopyWithImpl(_$AddTransactionLoadingImpl _value,
      $Res Function(_$AddTransactionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddTransactionLoadingImpl implements AddTransactionLoading {
  const _$AddTransactionLoadingImpl();

  @override
  String toString() {
    return 'AddTransactionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTransactionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddTransactionLoading value) loading,
    required TResult Function(AddTransactionError value) error,
    required TResult Function(AddTransactionSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddTransactionLoading value)? loading,
    TResult? Function(AddTransactionError value)? error,
    TResult? Function(AddTransactionSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddTransactionLoading value)? loading,
    TResult Function(AddTransactionError value)? error,
    TResult Function(AddTransactionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AddTransactionLoading implements AddTransactionState {
  const factory AddTransactionLoading() = _$AddTransactionLoadingImpl;
}

/// @nodoc
abstract class _$$AddTransactionErrorImplCopyWith<$Res> {
  factory _$$AddTransactionErrorImplCopyWith(_$AddTransactionErrorImpl value,
          $Res Function(_$AddTransactionErrorImpl) then) =
      __$$AddTransactionErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$AddTransactionErrorImplCopyWithImpl<$Res>
    extends _$AddTransactionStateCopyWithImpl<$Res, _$AddTransactionErrorImpl>
    implements _$$AddTransactionErrorImplCopyWith<$Res> {
  __$$AddTransactionErrorImplCopyWithImpl(_$AddTransactionErrorImpl _value,
      $Res Function(_$AddTransactionErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AddTransactionErrorImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$AddTransactionErrorImpl implements AddTransactionError {
  const _$AddTransactionErrorImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'AddTransactionState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTransactionErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTransactionErrorImplCopyWith<_$AddTransactionErrorImpl> get copyWith =>
      __$$AddTransactionErrorImplCopyWithImpl<_$AddTransactionErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddTransactionLoading value) loading,
    required TResult Function(AddTransactionError value) error,
    required TResult Function(AddTransactionSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddTransactionLoading value)? loading,
    TResult? Function(AddTransactionError value)? error,
    TResult? Function(AddTransactionSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddTransactionLoading value)? loading,
    TResult Function(AddTransactionError value)? error,
    TResult Function(AddTransactionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AddTransactionError implements AddTransactionState {
  const factory AddTransactionError(final Object error) =
      _$AddTransactionErrorImpl;

  Object get error;

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTransactionErrorImplCopyWith<_$AddTransactionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTransactionSuccessImplCopyWith<$Res> {
  factory _$$AddTransactionSuccessImplCopyWith(
          _$AddTransactionSuccessImpl value,
          $Res Function(_$AddTransactionSuccessImpl) then) =
      __$$AddTransactionSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddTransactionSuccessImplCopyWithImpl<$Res>
    extends _$AddTransactionStateCopyWithImpl<$Res, _$AddTransactionSuccessImpl>
    implements _$$AddTransactionSuccessImplCopyWith<$Res> {
  __$$AddTransactionSuccessImplCopyWithImpl(_$AddTransactionSuccessImpl _value,
      $Res Function(_$AddTransactionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddTransactionSuccessImpl implements AddTransactionSuccess {
  const _$AddTransactionSuccessImpl();

  @override
  String toString() {
    return 'AddTransactionState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTransactionSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddTransactionLoading value) loading,
    required TResult Function(AddTransactionError value) error,
    required TResult Function(AddTransactionSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddTransactionLoading value)? loading,
    TResult? Function(AddTransactionError value)? error,
    TResult? Function(AddTransactionSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddTransactionLoading value)? loading,
    TResult Function(AddTransactionError value)? error,
    TResult Function(AddTransactionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AddTransactionSuccess implements AddTransactionState {
  const factory AddTransactionSuccess() = _$AddTransactionSuccessImpl;
}
