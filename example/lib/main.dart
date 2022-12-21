import 'package:flutter/material.dart';
import 'package:finicity/finicity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _finicityPlugin = Finicity();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: GestureDetector(
          onTap: () async {
            var result = await _finicityPlugin.initFinicity();
            print(result);
          },
          child: const Center(
            child: Text('Tap me to connect to Finicity'),
          ),
        ),
      ),
    );
  }
}
