import 'package:flutter/material.dart';
import 'package:fokkkus/components/slider.dart';

class TimerSettings extends StatefulWidget {
  const TimerSettings({super.key});

  @override
  State<TimerSettings> createState() => _TimerSettingsState();
}

class _TimerSettingsState extends State<TimerSettings> {
  @override
  Widget build(BuildContext context) {
    double currentValue = 5;
    // final focusDuration = TextEditingController();

    Widget buildBottomSheetContent() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 400,
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
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    'Focus Duration (min)',
                    style: TextStyle(
                      color: Color(0xFF2E232F),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    currentValue.toString(),
                    style: const TextStyle(
                      color: Color(0xFF2E232F),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
              MaxValueSlider(
                  maxValue: 30,
                  minValue: 5,
                  onValueChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  })
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
