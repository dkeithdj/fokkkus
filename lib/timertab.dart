import 'package:flutter/material.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({Key? key}) : super(key: key);

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  bool _switch = false;
  final ThemeData _dark = ThemeData(brightness: Brightness.dark);
  final ThemeData _light = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _switch ? _dark : _light,
      child: Scaffold(
        // backgroundColor: const Color(0xFFFAF9FA),
        backgroundColor: Colors.amberAccent,
        body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 50),
                      child: Switch(
                        value: _switch,
                        onChanged: (_newvalue) {
                          setState(
                            () {
                              _switch = _newvalue;
                            },
                          );
                          const VisualDensity(horizontal: -2.0, vertical: -2.0);
                        },
                        activeColor: const Color(0xFF2E232F),
                        inactiveTrackColor: const Color(0xFFFAF9FA),
                        thumbColor: MaterialStateProperty.resolveWith<Color>(
                            getThumbColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('../lib/icons/pomodorosettings.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 40),
                      child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  '../lib/icons/rotate-smartphone.png'),
                              fit: BoxFit.contain,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

Color getThumbColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return Colors.black12; //switch on
  }
  return const Color(0xFF2E232F);
}
//
