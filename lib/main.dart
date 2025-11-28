import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screen/open.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // === МОНГОЛ ОРЧУУЛГА ИДЭВХЖҮҮЛЭХ ===
      locale: const Locale("mn", "MN"),
      supportedLocales: const [
        Locale("en", "US"),
        Locale("mn", "MN"),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: const WelcomeScreen(),
    );
  }
}
