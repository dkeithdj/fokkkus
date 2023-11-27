import 'package:flutter/material.dart';
import 'package:fokkkus/components/themetoggle.dart';
import 'package:fokkkus/components/category.dart';
import 'package:fokkkus/components/timerset.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({Key? key}) : super(key: key);

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FA),
      body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.32,
                        child: const ThemeToggle(),
                      ),
                      SizedBox(
                        width: screenWidth * 0.32,
                        child: const TimerSettings(),
                      ),
                      SizedBox(
                        width: screenWidth * 0.32,
                        child: const Category(),
                      ),
                    ],
                  ),
                  //-----------------------------END--------------------------
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          )),
    );
  }
//----------------------------------END----------------------------
} //class end
