import 'package:riverpod_tst/hello.dart';
import 'dart:math' as math;

Future<Hello> getHello() async {
  await Future.delayed(Duration(milliseconds: 400));
  return Hello(hello: 'Hi ', name: "Ali ${math.Random().nextInt(1000)}");
}
