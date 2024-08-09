import 'package:flutter/material.dart';

class Layout3 extends StatelessWidget {
  const Layout3({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: const IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ContainerSection(text: 'Row 1', color: Colors.blue),
                  ContainerSection(text: 'Row 2', color: Colors.green),
                  ContainerSection(text: 'Row 3', color: Colors.orange),
                  Spacer(),
                  ContainerSection(
                      text: 'Row 4 (Sticky at Bottom)', color: Colors.red),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ContainerSection extends StatelessWidget {
  const ContainerSection({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
