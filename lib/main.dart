import 'package:flutter/material.dart';
import 'package:otlob/app/router.dart';
import 'package:otlob/app/theme.dart';
import 'package:otlob/app/di.dart' as di;

void main() {
  di.init();
  runApp(const OtlobApp());
}

class OtlobApp extends StatelessWidget {
  const OtlobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().router,
      theme: AppTheme.lightTheme,
      title: 'Otlob',
    );
  }
}
