import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_1/validators/validator.dart';

class EmailValidator extends Validator<String, String> {
  final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  @override
  String? validate(String? data, AppLocalizations l10n) {
    if (data == null || data.isEmpty) {
      return l10n.requiredFiledMessage;
    }

    if (!emailRegExp.hasMatch(data)) {
      return l10n.emailFormatMessage;
    }
    return null;
  }
}
