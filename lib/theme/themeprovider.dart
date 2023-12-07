import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeData get themeData => _isDarkMode
      ? ThemeData.dark().copyWith(
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
            background: Color(0xFF2E232F),
          ),
          textTheme: ThemeData.dark().textTheme.apply(
                bodyColor: const Color(0xFFFAF9FA), // Customize body text color
                displayColor:
                    const Color(0xFFFAF9FA), // Customize headline text color
              ),
          iconTheme: ThemeData.dark().iconTheme.copyWith(
                color: const Color(0xFFFAF9FA), // Customize icon color
              ),
        )
      : ThemeData.light().copyWith(
          brightness: Brightness.light,
          colorScheme: const ColorScheme.light(
            background: Color(0xFFFAF9FA),
          ),
          textTheme: ThemeData.light().textTheme.apply(
                bodyColor: const Color(0xFF2E232F), // Customize body text color
                displayColor:
                    const Color(0xFF2E232F), // Customize headline text color
              ),
          iconTheme: ThemeData.light().iconTheme.copyWith(
                color: const Color(0xFF2E232F), // Customize icon color
              ),
        );

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
