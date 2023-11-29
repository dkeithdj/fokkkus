import 'package:flutter/material.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool _switch = false;
  final ThemeData _dark = ThemeData(brightness: Brightness.dark);
  final ThemeData _light = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _switch ? _dark : _light,
      child: Switch(
        value: _switch,
        // ignore: no_leading_underscores_for_local_identifiers
        onChanged: (_newvalue) {
          setState(
            () {
              _switch = _newvalue; //not final yet
            },
          );
          const VisualDensity(horizontal: -4.0, vertical: -4.0);
        },
        activeColor: const Color(0xFF2E232F),
        inactiveTrackColor: const Color(0xFF2E232F),
        thumbColor: MaterialStateProperty.resolveWith<Color>(getThumbColor),
      ),
    );
  }
}

Color getThumbColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return const Color(0xFF2E232F); //switch on
  }
  return const Color(0xFFFAF9FA);
}
