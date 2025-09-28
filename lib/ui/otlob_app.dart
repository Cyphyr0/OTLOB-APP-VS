import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'theme/otlob_theme.dart';

class OtlobApp extends StatelessWidget {
  const OtlobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otlob',
      debugShowCheckedModeBanner: false,
      theme: OtlobTheme.light(),
      home: const OnboardingScreen(),
    );
  }
}
