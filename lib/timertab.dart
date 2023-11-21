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
        body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    //----------------------------------ROW-----------------------
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 66, right: 30),
                          child: Switch(
                            value: _switch,
                            onChanged: (_newvalue) {
                              setState(
                                () {
                                  _switch = _newvalue; //not final yet
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
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30))),
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                        height: 400,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30.0,
                                                            right: 86.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        //insert function add button here
                                                      },
                                                      child: Container(
                                                        width: 30,
                                                        height: 30,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                '../lib/icons/add.png'),
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                const Padding(
                                                  padding: EdgeInsets.all(30.0),
                                                  child: Text(
                                                      'FOCUS CATEGORIES',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF735D78),
                                                          fontSize: 15,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 94.0,
                                                            right: 30.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        width: 30,
                                                        height: 30,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                '../lib/icons/close.png'),
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ));
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
                          padding: const EdgeInsets.only(left: 30, right: 60),
                          child: GestureDetector(
                            onTap: () {
                              //insert rotate function heree
                            },
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
                        ),
                      ],
                    ),
                    //-----------------------------END--------------------------
                    const SizedBox(
                      height: 20,
                    ),
                    //---------------------------STUPID TIMER-------------------
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
