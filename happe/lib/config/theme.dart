import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    // Primary color: near black, but not pure black
    const Color primaryColor =
        Color(0xFF212121); // Very dark grey (almost black)
    // Secondary color: cool orange
    const Color secondaryColor = Color(0xFFFF7043); // A cool, vibrant orange

    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme(
        primary: primaryColor, // Slightly darker shade for variants
        secondary: secondaryColor, // A deeper shade of the secondary color
        surface: Color(0xFF333333), // Dark grey for surface color
        background: Color(0xFF424242), // Medium-dark grey for backgrounds
        error: Colors.red, // Default red color for error
        onPrimary: Colors.white, // Text/icon color on primary color
        onSecondary: Colors.white, // Text/icon color on secondary color
        onSurface: Colors.white, // Text/icon color on surface
        onBackground: Colors.white, // Text/icon color on background
        onError: Colors.white, // Text/icon color on error
        brightness: Brightness.dark, // Overall theme brightness
      ),
      scaffoldBackgroundColor: Color(0xFF212121),
      appBarTheme: AppBarTheme(
        color: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      ),
    );
  }
}
