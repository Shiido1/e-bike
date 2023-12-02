import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prestmit/data/source/fake_source.dart';
import 'package:prestmit/data/source/fake_source_impl.dart';

final fakeSourceModule = Provider<FakeSource>((_) => FakeSourceImpl());
