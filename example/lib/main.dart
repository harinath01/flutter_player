import 'package:flutter/material.dart';

import 'package:flutter_player_plugin/player_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter player plugin'),
        ),
        body: Column(
          children: [
            Container(
              height: 240,
              color: Colors.black,
              child: const Center(
                  child: PlayerView(),
            ))
          ],
        ),
      ),
    );
  }
}
