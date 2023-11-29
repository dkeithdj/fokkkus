import 'package:flutter/material.dart';
import 'package:fokkkus/timertab_components/roundbutton.dart';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});

  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
  }

  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${count.inSeconds}';
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
        Expanded(
          child: Center(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Text(
                countText,
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    controller.reverse(
                        from: controller.value == 0 ? 1.0 : controller.value);
                  },
                  child: RoundButton(icon: Icons.play_arrow)),
              RoundButton(icon: Icons.stop)
            ],
          ),
        ),
      ],
    );
  }
}
