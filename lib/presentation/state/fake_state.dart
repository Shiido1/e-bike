import 'package:freezed_annotation/freezed_annotation.dart';

part 'fake_state.freezed.dart';

@Freezed(copyWith: true)
class FakeState<T> with _$FakeState<T> {
  const factory FakeState(
      {@Default(false) bool isBusy,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace}) = _FakeState<T>;
}
