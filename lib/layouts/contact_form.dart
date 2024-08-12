import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../validators/email_validator.dart';
import '../validators/phone_validator.dart';
import '../widgets/form_sections/field_with_validation_widget.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _phoneError;
  String? _emailError;

  // Instances of the validators
  final EmailValidator _emailValidator = EmailValidator();
  final PhoneValidator _phoneValidator = PhoneValidator();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Localizations.override(
        context: context,
        locale: const Locale('en'),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final appLocalizationContext = AppLocalizations.of(context);
            final theme = Theme.of(context);
            bool isWideScreen = constraints.maxWidth > 600;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldWithValidationWidget(
                      controller: _emailController,
                      labelText: appLocalizationContext!.emailLabel,
                      validator: (value) => _emailValidator.validate(
                          value, appLocalizationContext),
                      errorText: _emailError,
                      isWideScreen: isWideScreen,
                    ),
                    const SizedBox(height: 16),
                    FieldWithValidationWidget(
                      controller: _phoneController,
                      labelText: appLocalizationContext.phoneLabel,
                      validator: (value) => _phoneValidator.validate(
                          value, appLocalizationContext),
                      errorText: _phoneError,
                      isWideScreen: isWideScreen,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.secondary,
                      ),
                      onPressed: () {
                        setState(() {
                          _emailError = _emailValidator.validate(
                              _emailController.text, appLocalizationContext);
                          _phoneError = _phoneValidator.validate(
                              _phoneController.text, appLocalizationContext);
                        });

                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text(appLocalizationContext.processingData),
                            ),
                          );
                        }
                      },
                      child: Text(appLocalizationContext.submitLabel),
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
