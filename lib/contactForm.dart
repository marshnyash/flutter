import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
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
    return Scaffold(
      body: Localizations.override(
        context: context,
        locale: const Locale('en'),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWideScreen = constraints.maxWidth > 600;
            bool showEmailErrorInline = isWideScreen && _emailError != null;
            bool showPhoneErrorInline = isWideScreen && _phoneError != null;

            final appLocalizationContext = AppLocalizations.of(context);
            // appLocalizationContext!.helloWorld

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: appLocalizationContext!.emailLabel,
                                  errorStyle: const TextStyle(
                                      color: Colors.transparent, fontSize: 0),
                                  errorText: _emailError,
                                ),
                                validator: (value) => _validateEmail(value),
                              ),
                            ),
                            if (showEmailErrorInline)
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  _emailError ?? '',
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              ),
                          ],
                        ),
                        if (!isWideScreen && _emailError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _emailError ?? '',
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  labelText: appLocalizationContext.phoneLabel,
                                  // why not !.
                                  errorStyle: const TextStyle(
                                      color: Colors.transparent, fontSize: 0),
                                  errorText: _phoneError,
                                ),
                                validator: (value) => _validatePhone(value),
                              ),
                            ),
                            if (showPhoneErrorInline)
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  _phoneError ?? '',
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              ),
                          ],
                        ),
                        if (!isWideScreen && _emailError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _emailError ?? '',
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                    // _buildFieldWithValidation(
                    //   controller: _phoneController,
                    //   labelText: 'Phone Number',
                    //   validator: _validatePhone,
                    //   errorText: _phoneError,
                    //   isWideScreen: isWideScreen,
                    // ),
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
          },
        ),
      ),
    );
  }
}

// Widget _buildFieldWithValidation({
//   required TextEditingController controller,
//   required String labelText,
//   required String? Function(String?) validator,
//   required String? errorText,
//   required bool isWideScreen,
// }) {
//   return LayoutBuilder(
//     builder: (context, constraints) {
//       bool showErrorInline = isWideScreen && errorText != null;
//
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   controller: controller,
//                   decoration: InputDecoration(
//                     labelText: labelText,
//                     errorText: errorText,
//                   ),
//                   validator: (value) {
//                     return validator(value);
//                   },
//                 ),
//               ),
//               if (showErrorInline)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Text(
//                     errorText,
//                     style: const TextStyle(color: Colors.red, fontSize: 12),
//                   ),
//                 ),
//             ],
//           ),
//           if (!isWideScreen && errorText != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(
//                 errorText,
//                 style: const TextStyle(color: Colors.red, fontSize: 12),
//               ),
//             ),
//         ],
//       );
//     },
//   );
// }
