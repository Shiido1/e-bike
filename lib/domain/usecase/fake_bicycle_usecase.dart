import 'package:prestmit/domain/model/fake_data.dart';

import '../../usecase/fake_usecase.dart';
import '../repository/fake_repo.dart';

class FakeBicycleUseCaseImpl
    implements FakeUseCaseWithOutParam<Future<FakeData>> {
  final FakeRepo _fakeRepo;

  FakeBicycleUseCaseImpl(this._fakeRepo);

  @override
  Future<FakeData> execute() async => await _fakeRepo.fakeBicycle();
}
