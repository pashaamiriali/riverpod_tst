import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tst/hello.dart';
import 'package:riverpod_tst/repo.dart';
part 'provider.g.dart';

@riverpod
Future<Hello> sayHello(SayHelloRef ref) async {
  var hello = await getHello();
  return hello;
}
