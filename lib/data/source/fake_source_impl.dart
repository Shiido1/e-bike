import 'package:prestmit/domain/model/fake_data.dart';

import 'fake_source.dart';

class FakeSourceImpl implements FakeSource {
  FakeSourceImpl();

  @override
  Future<FakeData> fakeBicycle() async {
    await Future.delayed(Duration(seconds: 2));
    return FakeData();
  }

  @override
  Future<FakeData> trackingHistory() async {
    await Future.delayed(Duration(seconds: 2));
    return FakeData();
  }
}
