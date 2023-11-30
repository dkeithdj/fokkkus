import 'package:flutter/material.dart';
import 'package:fokkkus/timertab_components/themetoggle.dart';
import 'package:fokkkus/timertab_components/category.dart';
import 'package:fokkkus/timertab_components/timer.dart';
import 'package:fokkkus/timertab_components/timersettings.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({Key? key}) : super(key: key);

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  double timerDuration = 0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFAF9FA),
      body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
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
                  Expanded(child: PomodoroTimer()),
                ],
              ),
            ],
          )),
    );
  }
} //class end
