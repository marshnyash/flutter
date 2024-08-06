import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _emailError;
  String? _phoneError;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field is required';
    }

    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field is required';
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isWideScreen = constraints.maxWidth > 600;
      // print(isWideScreen);

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFieldWithValidation(
                controller: _emailController,
                labelText: 'Email',
                validator: _validateEmail,
                errorText: _emailError,
                isWideScreen: isWideScreen,
              ),
              const SizedBox(height: 16),
              _buildFieldWithValidation(
                controller: _phoneController,
                labelText: 'Phone Number',
                validator: _validatePhone,
                errorText: _phoneError,
                isWideScreen: isWideScreen,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _emailError = _validateEmail(_emailController.text);
                    _phoneError = _validatePhone(_phoneController.text);
                  });

                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget _buildFieldWithValidation({
  required TextEditingController controller,
  required String labelText,
  required String? Function(String?) validator,
  required String? errorText,
  required bool isWideScreen,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      bool showErrorInline = isWideScreen && errorText != null;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: labelText,
                    // errorText: isWideScreen
                    //     ? null
                    //     : errorText, // Show error below for narrow screens
                  ),
                  validator: (value) {
                    // if (isWideScreen) {
                    //   // For wide screens, don't use errorText in InputDecoration
                    //   return null;
                    // }
                    return null;
                    // return validator(value);
                  },
                ),
              ),
              if (showErrorInline)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    errorText,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
            ],
          ),
          if (!isWideScreen && errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                errorText,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      );
    },
  );
}
