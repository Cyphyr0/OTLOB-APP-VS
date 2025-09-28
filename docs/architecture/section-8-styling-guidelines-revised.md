### **Section 8: Styling Guidelines (Revised)**

#### **Global Theme Definition (`app/theme.dart`)**
```dart
import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({ required this.spacing, required this.radii });
  final AppSpacing spacing;
  final AppRadii radii;
}

class AppSpacing {
  const AppSpacing({
    this.small = 8.0,
    this.medium = 16.0,
    this.large = 24.0,
  });
  final double small;
  final double medium;
  final double large;
}

class AppRadii {
  const AppRadii({
    this.small = const BorderRadius.all(Radius.circular(8.0)),
    this.medium = const BorderRadius.all(Radius.circular(12.0)),
  });
  final BorderRadius small;
  final BorderRadius medium;
}

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0D1B2A),
      secondary: Color(0xFFE07A5F),
      surface: Color(0xFFF8F9FA),
      background: Colors.white,
      error: Color(0xFFFF4136),
      tertiary: Color(0xFF3D9970), // Success
      inversePrimary: Color(0xFFFFDC00), // Warning
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(fontFamily: 'Poppins', fontSize: 28, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(fontFamily: 'Roboto', fontSize: 22, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontFamily: 'Roboto', fontSize: 16),
      bodyMedium: TextStyle(fontFamily: 'Roboto', fontSize: 14),
      labelSmall: TextStyle(fontFamily: 'Roboto', fontSize: 12, letterSpacing: 0.5),
    ),
    extensions: <ThemeExtension<dynamic>>[
      const AppThemeExtension(
        spacing: AppSpacing(),
        radii: AppRadii(),
      ),
    ],
  );
}

extension CustomThemeContext on BuildContext {
  AppThemeExtension get customTheme => Theme.of(this).extension<AppThemeExtension>()!;
}
```

#### **Accessibility Considerations**
*   **Text Scaling:** The defined `TextTheme` must be tested to ensure it scales gracefully with `MediaQuery.textScaleFactor`.
*   **Contrast Ratios:** The color palette must be verified to meet WCAG AA contrast ratios.