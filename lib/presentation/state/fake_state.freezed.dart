// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fake_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FakeState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FakeStateCopyWith<T, FakeState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FakeStateCopyWith<T, $Res> {
  factory $FakeStateCopyWith(
          FakeState<T> value, $Res Function(FakeState<T>) then) =
      _$FakeStateCopyWithImpl<T, $Res, FakeState<T>>;
  @useResult
  $Res call(
      {bool isBusy, T? data, String? errorMessage, StackTrace? stackTrace});
}

/// @nodoc
class _$FakeStateCopyWithImpl<T, $Res, $Val extends FakeState<T>>
    implements $FakeStateCopyWith<T, $Res> {
  _$FakeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FakeStateImplCopyWith<T, $Res>
    implements $FakeStateCopyWith<T, $Res> {
  factory _$$FakeStateImplCopyWith(
          _$FakeStateImpl<T> value, $Res Function(_$FakeStateImpl<T>) then) =
      __$$FakeStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy, T? data, String? errorMessage, StackTrace? stackTrace});
}

/// @nodoc
class __$$FakeStateImplCopyWithImpl<T, $Res>
    extends _$FakeStateCopyWithImpl<T, $Res, _$FakeStateImpl<T>>
    implements _$$FakeStateImplCopyWith<T, $Res> {
  __$$FakeStateImplCopyWithImpl(
      _$FakeStateImpl<T> _value, $Res Function(_$FakeStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$FakeStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$FakeStateImpl<T> implements _FakeState<T> {
  const _$FakeStateImpl(
      {this.isBusy = false, this.data, this.errorMessage, this.stackTrace});

  @override
  @JsonKey()
  final bool isBusy;
  @override
  final T? data;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'FakeState<$T>(isBusy: $isBusy, data: $data, errorMessage: $errorMessage, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FakeStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isBusy,
      const DeepCollectionEquality().hash(data), errorMessage, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FakeStateImplCopyWith<T, _$FakeStateImpl<T>> get copyWith =>
      __$$FakeStateImplCopyWithImpl<T, _$FakeStateImpl<T>>(this, _$identity);
}

abstract class _FakeState<T> implements FakeState<T> {
  const factory _FakeState(
      {final bool isBusy,
      final T? data,
      final String? errorMessage,
      final StackTrace? stackTrace}) = _$FakeStateImpl<T>;

  @override
  bool get isBusy;
  @override
  T? get data;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$FakeStateImplCopyWith<T, _$FakeStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
