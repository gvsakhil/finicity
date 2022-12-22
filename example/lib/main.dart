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
            var connectUrl =
                "https://connect2.finicity.com?customerId=6016856917&origin=url&partnerId=2445584079374&signature=94c67b5f4b3e0e21dac3f20ca23361aa1a1b0e80a47bab26e146e7fbf0b7466e&timestamp=1671644717385&ttl=1671651917385";
            var result = await _finicityPlugin.initFinicity(connectUrl);
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
