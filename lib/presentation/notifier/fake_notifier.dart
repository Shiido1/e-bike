import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/fake_data.dart';
import '../state/fake_state.dart';
import 'module/module.dart';

part 'fake_notifier.g.dart';

@riverpod
class FakeNotifier extends _$FakeNotifier {
  @override
  FakeState build() => const FakeState(isBusy: true);

  FakeData? _fakeData;

  Future<void> getFakeBicycle() async {
    try {
      state = state.copyWith(isBusy: true);

      _fakeData = await ref.read(fakeBicycleProvider.future);
    } catch (e) {
      debugPrintStack(label: e.toString());
    }
    state = state.copyWith(isBusy: false, data: _fakeData);
  }

  Future<void> trackingHistory() async {
    try {
      state = state.copyWith(isBusy: true);

      _fakeData = await ref.read(trackingHistoryProvider.future);
    } catch (e) {
      debugPrintStack(label: e.toString());
    }
    state = state.copyWith(isBusy: false, data: _fakeData);
  }
}
