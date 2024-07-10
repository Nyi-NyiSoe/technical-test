import 'package:flutter/material.dart';
import 'package:technicaltest/theme/button_theme.dart';
import 'package:technicaltest/theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.lightTextTheme,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4285F4), // Soft blue
      onPrimary: Color(0xffffffff), // White
      secondary: Color(0xffF4B400), // Warm inviting color
      onSecondary: Color(0xff000000), // Black for readability
      error: Color(0xffD32F2F), // Noticeable red
      onError: Color(0xffffffff), // White
      surface: Color(0xffffffff), // White
      onSurface: Color(0xff000000), // Black
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Color(0xffF5F5F5), // Light grey for card background
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff4285F4), // Soft blue
      foregroundColor: Colors.white, // Text color
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    textTheme: TTextTheme.darkTextTheme,
    fontFamily: 'MateSC',
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffBB86FC), // Muted purple
      onPrimary: Color(0xff000000), // Black
      secondary: Color(0xff03DAC6), // Cooler relaxing color
      onSecondary: Color(0xffFFFFFF), // Light color for readability
      error: Color(0xffCF6679), // Softer red
      onError: Color(0xff000000), // Black
      surface: Color(0xff121212), // Dark surface
      onSurface: Color(0xffffffff), // White
    ),
    scaffoldBackgroundColor: Color(0xff121212),
    cardColor: Color(0xffBB86FC), // Dark grey for card background
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffBB86FC), // Muted purple
      foregroundColor: Colors.black, // Text color
    ),
  );
}
