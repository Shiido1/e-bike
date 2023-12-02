import 'package:prestmit/domain/model/fake_data.dart';

abstract class FakeSource {
  Future<FakeData> fakeBicycle();
  Future<FakeData> trackingHistory();
}
