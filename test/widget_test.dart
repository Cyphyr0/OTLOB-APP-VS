// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otlob/app/di.dart' as di;
import 'package:otlob/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Initialize dependencies
    di.init();
    
    // Build our app and trigger a frame.
    await tester.pumpWidget(const OtlobApp());

    // TODO: Add meaningful widget tests for your app
    // This is just a placeholder test
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
