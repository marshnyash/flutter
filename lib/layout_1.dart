import 'package:flutter/material.dart';

class Layout1 extends StatelessWidget {
  const Layout1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 315,
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: ContainerSection(text: '1 widget'),
            ),
            SizedBox(height: 15),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: ContainerSection(text: '2 widget')),
                  SizedBox(width: 15),
                  Expanded(
                    child: ContainerSection(
                      text: '3 widget\nBox\nwith\nmultiple\nlines',
                    ),
                  )
                ],
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
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
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
