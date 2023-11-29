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
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FA),
      body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: screenWidth * 0.32,
                    child: const PomodoroTimer(),
                  ),
                ],
              ),
            ],
          )),
    );
  }
} //class end
