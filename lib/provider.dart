import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tst/hello.dart';
import 'package:riverpod_tst/repo.dart';
part 'provider.g.dart';

@riverpod
class SayHello extends _$SayHello {
  @override
  Future<Hello> build() async {
    return await getHello();
  }

  Future<void> sayHelloAgain() async {
    try {
      state = const AsyncLoading();
      var newHello = await getHello();
      state = AsyncData(newHello);
    } catch (_) {
      state = AsyncError(Exception(), StackTrace.current);
    }
  }
}
