import 'package:flutter/material.dart';
import 'package:fokkkus/timertab_components/themetoggle.dart';
import 'package:fokkkus/timertab_components/category.dart';
import 'package:fokkkus/timertab_components/timer.dart';
import 'package:fokkkus/timertab_components/timersettings.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({super.key});

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  double timerDuration = 0;
  String timerstate = "focus";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFFFAF9FA),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Spacer(),
                    ThemeToggle(),
                    Spacer(),
                    TimerSettings(),
                    Spacer(),
                    Category(),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: FocusTimer(),
                ),
              ],
            ),
          ],
        ));
  }
}

//class end
