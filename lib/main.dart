import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:logger/logger.dart';
import 'package:talentei/pages/feedback_doctor.dart';

import 'package:talentei/pages/result/test_result.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);
void demo() {
  logger.d('Log message with 2 methods');

  loggerNoStack.i('Info message');

  loggerNoStack.w('Just a warning!');

  logger.e('Error! Something bad happened', error: 'Test Error');

  loggerNoStack.t({'key': 5, 'value': 'something'});

  Logger(printer: SimplePrinter(colors: true)).t('boom');
}

void main() {
  demo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      localizationsDelegates: [
        // Add Localization
        PersianMaterialLocalizations.delegate,
        PersianCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: 'Dana',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
            TargetPlatform.values,
            value: (_) => const FadeForwardsPageTransitionsBuilder(),
          ),
        ),
      ),
      home: FeedBackPage(),
    );
  }
}
