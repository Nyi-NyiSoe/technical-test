import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'MateSC',
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'MateSC',
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'MateSC',
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'MateSC',
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: 'MateSC',
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: 'MateSC',
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: 'MateSC',
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 19,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: 'MateSC',
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.5),
      fontFamily: 'MateSC',
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: 'MateSC',
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black.withOpacity(0.5),
      fontFamily: 'MateSC',
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'MateSC',
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: 'MateSC',
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: 'MateSC',
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: 'MateSC',
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: 'MateSC',
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: 'MateSC',
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: 'MateSC',
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 19,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: 'MateSC',
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: Colors.white.withOpacity(0.5),
      fontFamily: 'MateSC',
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: 'MateSC',
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.white.withOpacity(0.5),
      fontFamily: 'MateSC',
    ),
  );
}
