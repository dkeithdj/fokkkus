import 'package:flutter/material.dart';

class TimerSettings extends StatelessWidget {
  const TimerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
        onTap: () {
          //insert rotate function heree
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
      ),
    );
  }
}
