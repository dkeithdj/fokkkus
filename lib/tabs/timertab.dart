import 'package:flutter/material.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:fokkkus/theme/themetoggle.dart';
import 'package:fokkkus/timertab_components/category_sheet.dart';
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
    return Container(
        color: themeData.colorScheme.background,
        child: const Stack(
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
                    CategorySheet(),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: FocusTimer(),
                ),
                // SizedBox(
                //   height: 60,
                // ),
              ],
            ),
          ],
        ));
  }
}

//class end
