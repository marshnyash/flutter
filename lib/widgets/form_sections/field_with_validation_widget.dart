import 'package:flutter/material.dart';

import 'padding_section_widget.dart';

const _widthPart = 0.7;

class FieldWithValidationWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;
  final String? errorText;
  final bool isWideScreen;

  const FieldWithValidationWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
    required this.errorText,
    required this.isWideScreen,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          double fieldWidth = constraints.maxWidth * _widthPart;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: fieldWidth,
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: labelText,
                        errorText: errorText,
                        errorStyle: const TextStyle(
                            color: Colors.transparent, fontSize: 0),
                      ),
                      validator: (value) => validator(value),
                    ),
                  ),
                  if (isWideScreen && errorText != null)
                    PaddingSectionWidget(errorText: errorText),
                ],
              ),
              if (!isWideScreen && errorText != null)
                PaddingSectionWidget(errorText: errorText),
            ],
          );
        },
      );
}
