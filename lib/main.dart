import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_1/theme/dark_theme.dart';
import 'package:task_1/theme/light_theme.dart';

import 'layouts/contactForm.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const ContactForm(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
