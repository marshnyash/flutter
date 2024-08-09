import '../constants/validationConstants.dart';

mixin InputValidator {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return REQUIRED_FIELD_ERROR_MESSAGE;
    }

    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegExp.hasMatch(value)) {
      return EMAIL_ERROR_MESSAGE;
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return REQUIRED_FIELD_ERROR_MESSAGE;
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return PHONE_ERROR_MESSAGE;
    }
    return null;
  }
}
