import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({ required this.spacing, required this.radii });
  final AppSpacing spacing;
  final AppRadii radii;

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    AppSpacing? spacing,
    AppRadii? radii,
  }) {
    return AppThemeExtension(
      spacing: spacing ?? this.spacing,
      radii: radii ?? this.radii,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return this; //This is not a correct implementation of lerp, but it is fine for now.
  }
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
      surfaceContainer: Color(0xFFF8F9FA),
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
