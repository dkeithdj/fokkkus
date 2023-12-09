import 'package:flutter/material.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;

    return Switch(
      value: isDarkMode,
      onChanged: (_) {
        themeProvider.toggleTheme();
      },
      activeColor: const Color(0xFFFAF9FA),
      inactiveTrackColor: const Color(0xFF2E232F),
      thumbColor: MaterialStateProperty.resolveWith<Color>(getThumbColor),
    );
  }

  Color getThumbColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Color(0xFFFAF9FA); // switch on
    }
    return const Color(0xFFFAF9FA);
  }
}
