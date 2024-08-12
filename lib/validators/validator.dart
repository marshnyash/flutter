import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class Validator<T, S> {
  S? validate(T? data, AppLocalizations l10n);
}
