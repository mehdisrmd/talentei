import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:talentei/pages/payment/payment.dart';

import 'package:talentei/pages/result/test_result.dart';

void main() {
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
      home: PaymentPage(),
    );
  }
}
