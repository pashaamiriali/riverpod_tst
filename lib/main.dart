import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tst/hello.dart';
import 'package:riverpod_tst/provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final AsyncValue<Hello> hello = ref.watch(sayHelloProvider);
          return switch (hello) {
            AsyncData(:final value) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    value.hello,
                  ),
                  Text(
                    value.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
            AsyncError() => const Text('Error'),
            _ => const CircularProgressIndicator(),
          };
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(sayHelloProvider.notifier).sayHelloAgain();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
