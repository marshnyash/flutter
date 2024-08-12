import 'package:flutter/material.dart';

class PaddingSectionWidget extends StatelessWidget {
  final String? errorText;

  const PaddingSectionWidget({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          errorText ?? '',
          style: TextStyle(
              color: Theme.of(context).colorScheme.error, fontSize: 12),
        ),
      );
}
