import 'package:prestmit/data/source/fake_source.dart';
import 'package:prestmit/domain/model/fake_data.dart';
import 'package:prestmit/domain/repository/fake_repo.dart';

class FakeRepoImpl implements FakeRepo {
  final FakeSource _fakeSource;

  FakeRepoImpl(this._fakeSource);

  @override
  Future<FakeData> fakeBicycle() async => await _fakeSource.fakeBicycle();

  @override
  Future<FakeData> trackingHistory() async =>
      await _fakeSource.trackingHistory();
}
