import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technicaltest/theme/custom_theme.dart';
import 'package:technicaltest/utils/providers.dart';

Consumer changeTheme() {
  return Consumer(
    builder: (context, ref, child) {
      final icon = ref.watch(iconProvider);
      return IconButton(
        icon: Icon(icon),
        onPressed: () {
          final newIcon =
              icon == Icons.light_mode ? Icons.dark_mode : Icons.light_mode;
          final newTheme = icon == Icons.light_mode
              ? TAppTheme.darkTheme
              : TAppTheme.lightTheme;

          ref.read(iconProvider.notifier).state = newIcon;

          ref.read(themeProvider.notifier).state = newTheme;
        },
      );
    },
  );
}
