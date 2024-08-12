import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_1/validators/validator.dart';

class PhoneValidator extends Validator<String, String> {
  final phoneRegExp = RegExp(r'^\d{10}$');

  @override
  String? validate(String? data, AppLocalizations l10n) {
    if (data == null || data.isEmpty) {
      return l10n.requiredFiledMessage;
    }

    if (!phoneRegExp.hasMatch(data)) {
      return l10n.phoneFormatMessage;
    }
    return null;
  }
}
