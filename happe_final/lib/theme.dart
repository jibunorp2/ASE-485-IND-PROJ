import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    // Define light theme colors
    return ThemeData(
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(
        primary: Colors.orange,
        secondary: Colors.black, // Previously accentColor
        background: Colors.white,
        onPrimary: Colors.white, // Color of text on primary color background
        onSecondary: Colors.white, // Color of text on secondary color background
      ),
      appBarTheme: AppBarTheme(
        color: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
        headline6: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.orange,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    // Define dark theme colors
    return ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[900],
      colorScheme: ColorScheme.dark(
        primary: Colors.black,
        secondary: Colors.orange, // Previously accentColor
        onPrimary: Colors.orange, // Color of text on primary color background
        onSecondary: Colors.black, // Color of text on secondary color background
      ),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(color: Colors.orange),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.orange),
        bodyText2: TextStyle(color: Colors.orange),
        headline6: TextStyle(color: Colors.orange, fontSize: 20.0),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
