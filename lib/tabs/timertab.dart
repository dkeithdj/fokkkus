import 'package:flutter/material.dart';
import 'package:fokkkus/services/authentication.dart';
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
    return Container(
        color: themeData.colorScheme.background,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    const Spacer(),
                    const ThemeToggle(),
                    const Spacer(),
                    const TimerSettings(),
                    const Spacer(),
                    const Category(),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Authentication().signOut();
                        },
                        child: const Text("out"))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Expanded(
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
