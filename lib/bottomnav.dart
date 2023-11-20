import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/infotab.dart';
import 'package:fokkkus/timertab.dart';
import 'package:fokkkus/todotab.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _TimerPageState();
}

class _TimerPageState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TimerTab(),
    ToDoTab(),
    InfoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: const Color(0xFFFAF9FA),
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            activeColor: const Color(0xFF2E232F),
            icon: Image.asset(
              '../lib/icons/timer.png',
              width: 30,
              height: 30,
              color: const Color(0xFF999999),
            ),
            title: const Text(
              'Timer',
              style: TextStyle(color: Color(0xFF2E232F)),
            ),
          ),
          FlashyTabBarItem(
            activeColor: const Color(0xFF2E232F),
            icon: Image.asset(
              '../lib/icons/to-do.png',
              width: 30,
              height: 30,
              color: const Color(0xFF999999),
            ),
            title: const Text(
              'To-Do List',
              style: TextStyle(color: Color(0xFF2E232F)),
            ),
          ),
          FlashyTabBarItem(
            activeColor: const Color(0xFF2E232F),
            icon: Image.asset(
              '../lib/icons/info.png',
              width: 30,
              height: 30,
              color: const Color(0xFF999999),
            ),
            title: const Text(
              'Info',
              style: TextStyle(color: Color(0xFF2E232F)),
            ),
          ),
        ],
      ),
    );
  }
}
