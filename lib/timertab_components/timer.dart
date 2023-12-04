import 'package:flutter/material.dart';
import 'package:fokkkus/timertab_components/provider.dart';
import 'package:fokkkus/timertab_components/roundbutton.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});

  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  bool isDoneDialogShown = false;
  double progress = 1.0;
  String timerstate = "focus";

  @override
  void initState() {
    super.initState();
    switch (timerstate) {
      case "focus":
        SliderValuesProvider sliderValuesProvider =
            Provider.of<SliderValuesProvider>(context, listen: false);
        controller = AnimationController(
            vsync: this, duration: const Duration(minutes: 1));
        // Duration(minutes: sliderValuesProvider.focusDuration.toInt()));
        sliderValuesProvider.addListener(() {
          controller.duration =
              Duration(minutes: sliderValuesProvider.focusDuration.toInt());
        });
        controller.addListener(() {
          notify();
          if (controller.isAnimating) {
            setState(() {
              progress = controller.value;
            });
          } else if (controller.status == AnimationStatus.completed) {
            setState(() {
              progress = 1.0;
            });
          }
        });
        break;
      case "break":
        SliderValuesProvider sliderValuesProvider =
            Provider.of<SliderValuesProvider>(context, listen: false);
        controller = AnimationController(
            vsync: this,
            duration:
                Duration(minutes: sliderValuesProvider.breakDuration.toInt()));
        sliderValuesProvider.addListener(() {
          controller.duration =
              Duration(minutes: sliderValuesProvider.breakDuration.toInt());
        });
        controller.addListener(() {
          notify();
          if (controller.isAnimating) {
            setState(() {
              progress = controller.value;
            });
          } else if (controller.status == AnimationStatus.completed) {
            setState(() {
              progress = 1.0;
            });
          }
        });
        break;
    }
  }

  String get status {
    if (timerstate == "focus") {
      return controller.isAnimating ? 'Stay focused' : 'Start to focus';
    }
    return controller.isAnimating ? 'Break time' : 'Start break';
  }

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void notify() {
    if (countText == '00:00' && !isDoneDialogShown) {
      isDone();
      setState(() {
        isPlaying = false;
        isDoneDialogShown = true;
      });
    }
  }

  void isDone() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Time\'s up!',
            style: TextStyle(
              color: Color(0xFF2E232F),
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            'Good job!',
            style: TextStyle(
              color: Color(0xFF2E232F),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.reset();
                controller.isDismissed;
                timerstate = "break";
              },
              child: const Text('Take a Break'),
            ),
            TextButton(
              onPressed: () {
                controller.reset();
                controller.isDismissed;
                Navigator.of(context).pop();
              },
              child: const Text('DONE'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
        ),
        Expanded(
          child: Center(
            child: Stack(alignment: Alignment.center, children: [
              SizedBox(
                  width: 300,
                  height: 300,
                  child: CircularProgressIndicator(
                    backgroundColor: const Color(0xFF4E404F),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.grey),
                    value: progress,
                    strokeWidth: 3.5,
                  )),
              Column(
                children: [
                  const Spacer(),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget? child) => Text(
                        status,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF4E404F))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: const TextStyle(
                          letterSpacing: 8,
                          fontSize: 50,
                          color: Color(0xFF4E404F),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ]),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      controller.reverse(
                          from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  child: RoundButton(
                      icon:
                          isPlaying == true ? Icons.pause : Icons.play_arrow)),
              const SizedBox(width: 80),
              GestureDetector(
                  onTap: () {
                    controller.reset();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                  child: const RoundButton(icon: Icons.stop)),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
