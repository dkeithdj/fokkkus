import 'package:flutter/material.dart';
import 'package:fokkkus/bottomnav.dart';
import 'package:fokkkus/timertab_components/provider.dart';
import 'package:fokkkus/timertab_components/roundbutton.dart';
import 'package:provider/provider.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({super.key});

  @override
  State<FocusTimer> createState() => _FocusTimerState();
}

class _FocusTimerState extends State<FocusTimer> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  bool isDoneDialogShown = false;
  double progress = 1.0;
  int duration = 0;
  late SliderValuesProvider timevalues;
  String timerSt = "";

  void isDone() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Time\'s up!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF2E232F),
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            'Good job!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF2E232F),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the current dialog
                    controller.reset();
                    controller.isDismissed;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNav()),
                    );
                    timevalues.updateStatus("focus");
                  },
                  child: const Text('Skip Break'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the current dialog
                    controller.reset();
                    controller.isDismissed;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNav()),
                    );
                    timevalues.updateStatus("break");
                  },
                  child: const Text('Take a Break'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  int timerduration() {
    timerSt = timevalues.timerstate;
    if (timerSt == "focus") {
      duration = 1;
      // duration = timevalues.focusDuration.toInt();
      // timevalues.addListener(() {
      //   duration = timevalues.focusDuration.toInt();
      // });
    } else {
      duration = timevalues.breakDuration.toInt();
      timevalues.addListener(() {
        duration = timevalues.breakDuration.toInt();
      });
    }
    return duration;
  }

  @override
  void initState() {
    super.initState();
    timevalues = Provider.of<SliderValuesProvider>(context, listen: false);
    timevalues.addListener(() {
      print("Timer state changed: ${timevalues.timerstate}");
      setState(() {
        timerSt = timevalues.timerstate;
      });
    });
    duration = timerduration();
    print(duration);
    controller =
        AnimationController(vsync: this, duration: Duration(minutes: duration));
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
  }

  String get status {
    if (timevalues.timerstate == "focus") {
      return controller.isAnimating ? 'Stay focused' : 'Start to focus';
    }
    return controller.isAnimating ? 'Take a break' : 'Start break';
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
                    progress = 120;
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
