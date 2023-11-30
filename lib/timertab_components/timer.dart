import 'package:flutter/material.dart';
import 'package:fokkkus/timertab_components/provider.dart';
import 'package:fokkkus/timertab_components/roundbutton.dart';
import 'package:provider/provider.dart';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});

  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  double progress = 1.0;

  @override
  void initState() {
    super.initState();
    SliderValuesProvider sliderValuesProvider =
        Provider.of<SliderValuesProvider>(context, listen: false);
    controller = AnimationController(
        vsync: this,
        duration:
            Duration(minutes: sliderValuesProvider.focusDuration.toInt()));
    sliderValuesProvider.addListener(() {
      controller.duration =
          Duration(minutes: sliderValuesProvider.focusDuration.toInt());
    });
    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
        });
      }
    });
  }

  String get status {
    return controller.isAnimating ? 'Stay focused' : 'Start to focus';
  }

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed || controller.isCompleted
        ? '${(controller.duration!.inMinutes).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
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
