import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prestmit/data/repository/fake_repo_impl.dart';

import '../../../domain/repository/fake_repo.dart';
import '../../source/module/module.dart';

final fakeRepoModule =
    Provider<FakeRepo>((ref) => FakeRepoImpl(ref.read(fakeSourceModule)));
