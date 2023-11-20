import 'package:flutter/material.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({Key? key}) : super(key: key);

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFF2E232F),
                ),
                child: ToggleButtons(
                  constraints: const BoxConstraints.expand(
                    width: 25,
                    height: 25,
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                  onPressed: (int index) {
                    setState(() {
                      _isDarkMode = index == 1;
                    });
                  },
                  isSelected: [_isDarkMode, !_isDarkMode],
                  selectedColor: Color(0xFF2E232F),
                  fillColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  children: const [
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 15,
                    ),
                    Icon(
                      Icons.nightlight_round,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
