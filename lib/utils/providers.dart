import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:technicaltest/theme/custom_theme.dart';

final languageProvider = StateProvider<String>((ref) => 'en');

final themeProvider = StateProvider<ThemeData>((ref) => TAppTheme.lightTheme);

final iconProvider = StateProvider<IconData>((ref) => Icons.sunny);

final imagCountProvider = StateProvider.autoDispose<int>((ref) => 1);