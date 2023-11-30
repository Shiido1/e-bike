import 'package:prestmit/data/repository/module/fake_repo_module.dart';
import 'package:prestmit/domain/usecase/fake_bicycle_usecase.dart';
import 'package:prestmit/usecase/fake_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../tracking_history_usecase.dart';

final getFakeBicycleUseCaseModule = Provider<FakeUseCaseWithOutParam>(
    (ref) => FakeBicycleUseCaseImpl(ref.read(fakeRepoModule)));

final getTrackingHistoryUseCaseModule = Provider<FakeUseCaseWithOutParam>(
    (ref) => TrackingHistoryUseCaseImpl(ref.read(fakeRepoModule)));
