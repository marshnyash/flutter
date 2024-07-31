import 'package:flutter/material.dart';

class Layout1 extends StatelessWidget {
  const Layout1({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntrinsicWidth(
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              child: ContainerSection(text: '1 widget'),
            ),
            SizedBox(height: 15),
            Flexible(
              flex: 1,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    ContainerSection(text: '2 widget', fullWidth: true),
                    SizedBox(width: 15),
                    ContainerSection(
                        text: '3 widget\nBox\nwith\nmultiple\nlines',
                        fullWidth: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerSection extends StatelessWidget {
  const ContainerSection({
    super.key,
    required this.text,
    this.fullWidth = false,
  });

  final String text;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? 150 : null,
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, color: Colors.purple),
      ),
    );
  }
}
