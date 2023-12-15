import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/services/timer_service.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:fokkkus/timertab_components/event/provider.dart';
import 'package:fokkkus/timertab_components/slider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class TimerSettings extends StatefulWidget {
  const TimerSettings({super.key});

  @override
  State<TimerSettings> createState() => _TimerSettingsState();
}

class _TimerSettingsState extends State<TimerSettings> {
  late int focusDuration;
  late int breakDuration;
  late int autoSessions;

  @override
  void initState() {
    super.initState();
    SliderValuesProvider sliderValuesProvider =
        Provider.of<SliderValuesProvider>(context, listen: false);
    // focusDuration = sliderValuesProvider.focusDuration;
    // breakDuration = sliderValuesProvider.breakDuration;
    focusDuration = sliderValuesProvider.focusDuration;
    breakDuration = sliderValuesProvider.breakDuration;
  }

  Widget buildBottomSheetContent() {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    SliderValuesProvider sliderValuesProvider =
        Provider.of<SliderValuesProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                  height: 30,
                ),
                const Spacer(),
                Text(
                  textAlign: TextAlign.center,
                  'TIMER SETTINGS',
                  style: TextStyle(
                    color: themeData.textTheme.titleLarge?.color ??
                        const Color(0xFF2E232F),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    SliderValuesProvider sliderValuesProvider =
                        Provider.of<SliderValuesProvider>(context,
                            listen: false);
                    sliderValuesProvider.addListener(() {
                      focusDuration = sliderValuesProvider.focusDuration;
                      breakDuration = sliderValuesProvider.breakDuration;
                    });
                    sliderValuesProvider.updateFocusDuration(focusDuration);
                    sliderValuesProvider.updateBreakDuration(breakDuration);
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.close,
                        size: 30,
                        color: themeData.textTheme.titleLarge?.color ??
                            const Color(0xFF2E232F)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SliderComponent(
              currentVal: sliderValuesProvider.focusDuration.toDouble(),
              minValue: 10,
              maxValue: 120,
              title: 'Focus Duration (min)',
              divisions: 24,
              customVariance: 5,
              onSliderChanged: (value) {
                setState(() {
                  focusDuration = value.toInt();
                });
              },
            ),
            const SizedBox(height: 20),
            SliderComponent(
              currentVal: sliderValuesProvider.breakDuration.toDouble(),
              minValue: 5,
              maxValue: 30,
              title: 'Break Duration (min)',
              divisions: 6,
              customVariance: 5,
              onSliderChanged: (value) {
                setState(() {
                  breakDuration = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
    // );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          builder: (BuildContext context) {
            return buildBottomSheetContent();
          },
        );
      },
      child: SizedBox(
        width: 30,
        height: 30,
        child: Icon(Icons.access_time_filled_rounded,
            size: 30,
            color:
                Provider.of<ThemeProvider>(context).themeData.iconTheme.color),
      ),
    );
  }
}
