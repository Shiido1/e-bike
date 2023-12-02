import 'package:prestmit/domain/model/fake_data.dart';

abstract class FakeRepo {
  Future<FakeData> fakeBicycle();
  Future<FakeData> trackingHistory();
}
