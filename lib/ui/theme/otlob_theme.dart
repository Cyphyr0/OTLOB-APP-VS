import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtlobColors {
  static const Color surfaceContainer = Color(0xFFF8F9FA);  // Replacing deprecated background
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFFFA4A46);
  static const Color byRestaurantTagBg = Color(0xFFFFE5E7);
  static const Color byRestaurantTagText = Color(0xFFD92D3A);
  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF8A8A8A);
}

class OtlobTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: OtlobColors.surfaceContainer,
      primaryColor: OtlobColors.primary,
      colorScheme: ColorScheme.light(
        primary: OtlobColors.primary,
        surface: OtlobColors.surface,
        surfaceContainer: OtlobColors.surfaceContainer,
        onPrimary: Colors.white,
        onSurface: OtlobColors.textPrimary,
      ),
      cardColor: OtlobColors.surface,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        bodyLarge: GoogleFonts.poppins(
          color: OtlobColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: OtlobColors.textSecondary,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: OtlobColors.surfaceContainer,
        elevation: 0,
        iconTheme: const IconThemeData(color: OtlobColors.textPrimary),
        titleTextStyle: GoogleFonts.poppins(
          color: OtlobColors.textPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: OtlobColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: OtlobColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintStyle: GoogleFonts.poppins(
          color: OtlobColors.textSecondary,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: OtlobColors.surface,
        selectedItemColor: OtlobColors.primary,
        unselectedItemColor: OtlobColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        elevation: 12,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: OtlobColors.byRestaurantTagBg,
        labelStyle: GoogleFonts.poppins(
          color: OtlobColors.byRestaurantTagText,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      cardTheme: CardThemeData(
        color: OtlobColors.surface,
        elevation: 4,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      ),
    );
  }
}
