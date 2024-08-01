import 'package:flutter/material.dart';
import 'package:task_1/layout_1.dart';
import 'package:task_1/layout_2.dart';

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
          title: const Text('Layout with IntrinsicHeight and IntrinsicWidth'),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Column(
                  children: [Layout1(), SizedBox(height: 30), Layout2()])),
        ),
      ),
    );
  }
}
