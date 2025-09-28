### **Section 9: Testing Requirements (Revised)**

#### **Widget Test Template (`restaurant_card_test.dart`)**
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otlob/shared_widgets/restaurant_card.dart';

void main() {
  testWidgets('RestaurantCard displays name and image', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RestaurantCard(
            name: 'Koshary El Tahrir',
            imageUrl: 'https://example.com/koshary.jpg',
          ),
        ),
      ),
    );
    expect(find.text('Koshary El Tahrir'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
```

#### **Testing Strategy & Best Practices**
*   **Unit Tests:** For all business logic in repositories, usecases, and BLoCs/Cubits.
*   **Widget Tests:** For all widgets to verify rendering and basic interactions.
*   **BLoC/Cubit Tests:** Use `bloc_test` to test all state transitions.
*   **Integration Tests:** For critical end-to-end user flows using `integration_test`.
*   **Golden Tests:** For key visual components to prevent UI regressions.
*   **Error & Edge Case Testing:** Tests must cover error states, empty states, and invalid inputs.

#### **Test Enforcement & CI/CD**
*   **Continuous Integration:** All tests must pass in the CI pipeline before any PR can be merged.
*   **Code Coverage:** Aim for a minimum of **80% test coverage** for all new code, tracked via CI.