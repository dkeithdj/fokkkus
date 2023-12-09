import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeData get themeData => _isDarkMode
      ? ThemeData.dark().copyWith(
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
            background: Color(0xFF2E232F),
          ),
          textTheme: ThemeData.dark().textTheme.copyWith(
                titleLarge: ThemeData.dark().textTheme.titleLarge?.copyWith(
                      color: const Color(0xFFFAF9FA),
                    ),
                displayMedium: ThemeData.dark()
                    .textTheme
                    .displayMedium
                    ?.copyWith(
                      color:
                          const Color(0xFFBFAEC4), // Custom color for headline2
                    ),
                headlineSmall:
                    ThemeData.dark().textTheme.displayMedium?.copyWith(
                          color: const Color(0xFF4E404F),
                        ),
              ),
          iconTheme: ThemeData.dark().iconTheme.copyWith(
                color: const Color(0xFFFAF9FA), // Customize icon color
              ),
        )
      : ThemeData.light().copyWith(
          brightness: Brightness.light,
          colorScheme: const ColorScheme.light(
            background: Color(0xFFF5F1F6),
          ),
          textTheme: ThemeData.dark().textTheme.copyWith(
                titleLarge: ThemeData.dark().textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF2E232F),
                    ),
                displayMedium:
                    ThemeData.dark().textTheme.displayMedium?.copyWith(
                          color: const Color(0xFF4E404F),
                        ),
                headlineSmall:
                    ThemeData.dark().textTheme.displayMedium?.copyWith(
                          color: const Color(0xFFBFAEC4),
                        ),
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
