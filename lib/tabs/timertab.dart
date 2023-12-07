import 'package:flutter/material.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:fokkkus/theme/themetoggle.dart';
import 'package:fokkkus/timertab_components/category.dart';
import 'package:fokkkus/timertab_components/timer.dart';
import 'package:fokkkus/timertab_components/timersettings.dart';
import 'package:provider/provider.dart';

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
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        body: const Stack(
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
