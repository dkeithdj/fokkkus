import 'package:flutter/material.dart';
import 'package:fokkkus/components/slider.dart';
// import 'package:fokkkus/components/slider.dart';

class TimerSettings extends StatefulWidget {
  const TimerSettings({super.key});

  @override
  State<TimerSettings> createState() => _TimerSettingsState();
}

class _TimerSettingsState extends State<TimerSettings> {
  @override
  Widget build(BuildContext context) {
    // double currentValue = 5;
    // final focusDuration = TextEditingController();

    Widget buildBottomSheetContent() {
      return Padding(
        padding: const EdgeInsets.all(15.0),
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
                  const Spacer(), // Add some spacing between widgets
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
              const SliderComponent(
                minValue: 10,
                maxValue: 120,
                title: 'Focus Duration (min)',
                divisions: 24,
                customVariance: 5,
              ),
              const SizedBox(height: 20),
              const SliderComponent(
                minValue: 5,
                maxValue: 30,
                title: 'Break Duration (min)',
                divisions: 6,
                customVariance: 5,
              ),
              const SizedBox(height: 20),
              const SliderComponent(
                minValue: 2,
                maxValue: 6,
                title: 'Auto-Sessions',
                divisions: 6,
                customVariance: 1,
              ),
            ],
          ),
        ),
      );
    }

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
          )),
    );
  }
}
