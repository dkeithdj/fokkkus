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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _switch ? _dark : _light,
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF9FA),
        // backgroundColor: Colors.amberAccent,
        body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70, right: 30),
                          child: Switch(
                            value: _switch,
                            onChanged: (_newvalue) {
                              setState(
                                () {
                                  _switch = _newvalue;
                                },
                              );
                              const VisualDensity(
                                  horizontal: -4.0, vertical: -4.0);
                            },
                            activeColor: const Color(0xFF2E232F),
                            inactiveTrackColor: const Color(0xFF2E232F),
                            thumbColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    getThumbColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0)),
                                      child: SizedBox(
                                        height: 400,
                                        child: Center(
                                            child: ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      '../lib/icons/pomodorosettings.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 50),
                          child: Container(
                              width: 26,
                              height: 26,
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
                ),
              ],
            )),
      ),
    );
  }
//----------------------------------END----------------------------
} //class end

Color getThumbColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return const Color(0xFF2E232F); //switch on
  }
  return const Color(0xFFFAF9FA);
}
