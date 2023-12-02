import 'package:prestmit/domain/model/fake_data.dart';

import '../../usecase/fake_usecase.dart';
import '../repository/fake_repo.dart';

class TrackingHistoryUseCaseImpl
    implements FakeUseCaseWithOutParam<Future<FakeData>> {
  final FakeRepo _fakeRepo;

  TrackingHistoryUseCaseImpl(this._fakeRepo);

  @override
  Future<FakeData> execute() async => await _fakeRepo.trackingHistory();
}
