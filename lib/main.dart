import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Localizations Sample App',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Fill the form'),
            ),
            body: Center(
                child: Column(children: [
              Localizations.override(
                context: context,
                locale: const Locale('es'),
                // Using a Builder to get the correct BuildContext.
                // Alternatively, you can create a new widget and Localizations.override
                // will pass the updated BuildContext to the new widget.
                child: Builder(
                  builder: (context) {
                    // A toy example for an internationalized Material widget.
                    return CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      onDateChanged: (value) {},
                    );
                  },
                ),
              ),
              ContactForm()
            ]))));
  }
}
