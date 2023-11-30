import 'package:flutter/material.dart';
import 'package:fokkkus/timertab_components/provider.dart';
import 'package:fokkkus/timertab_components/slider.dart';
import 'package:provider/provider.dart';

class TimerSettings extends StatefulWidget {
  const TimerSettings({Key? key}) : super(key: key);

  @override
  State<TimerSettings> createState() => _TimerSettingsState();
}

class _TimerSettingsState extends State<TimerSettings> {
  late double focusDuration;
  late double breakDuration;
  late double autoSessions;

  @override
  void initState() {
    super.initState();
    // Initialize values from the provider
    SliderValuesProvider sliderValuesProvider =
        Provider.of<SliderValuesProvider>(context, listen: false);
    focusDuration = sliderValuesProvider.focusDuration;
    breakDuration = sliderValuesProvider.breakDuration;
    autoSessions = sliderValuesProvider.autoSessions;
  }

  Widget buildBottomSheetContent() {
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
                const Text(
                  textAlign: TextAlign.center,
                  'TIMER SETTINGS',
                  style: TextStyle(
                    color: Color(0xFF2E232F),
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
                    sliderValuesProvider.updateFocusDuration(focusDuration);
                    sliderValuesProvider.updateBreakDuration(breakDuration);
                    sliderValuesProvider.updateAutoSessions(autoSessions);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('../lib/icons/close.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SliderComponent(
              currentVal: focusDuration,
              minValue: 10,
              maxValue: 120,
              title: 'Focus Duration (min)',
              divisions: 24,
              customVariance: 5,
              onSliderChanged: (value) {
                setState(() {
                  focusDuration = value;
                });
              },
            ),
            const SizedBox(height: 20),
            SliderComponent(
              currentVal: breakDuration,
              minValue: 5,
              maxValue: 30,
              title: 'Break Duration (min)',
              divisions: 6,
              customVariance: 5,
              onSliderChanged: (value) {
                setState(() {
                  breakDuration = value;
                });
              },
            ),
            const SizedBox(height: 20),
            SliderComponent(
              currentVal: autoSessions,
              minValue: 2,
              maxValue: 6,
              title: 'Auto-Sessions',
              divisions: 6,
              customVariance: 1,
              onSliderChanged: (value) {
                setState(() {
                  autoSessions = value;
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
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../lib/icons/pomodorosettings.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
