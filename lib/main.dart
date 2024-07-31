import 'package:flutter/material.dart';

import 'layout_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layout 1 with IntrinsicHeight'),
        ),
        body: const Center(
          child: Layout1(),
        ),
      ),
    );
  }
}
