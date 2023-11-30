import 'package:prestmit/domain/model/fake_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/module/module.dart';

part 'module.g.dart';

@riverpod
Future<FakeData> fakeBicycle(FakeBicycleRef ref) async =>
    await ref.read(getFakeBicycleUseCaseModule).execute();

@riverpod
Future<FakeData> trackingHistory(FakeBicycleRef ref) async =>
    await ref.read(getTrackingHistoryUseCaseModule).execute();
