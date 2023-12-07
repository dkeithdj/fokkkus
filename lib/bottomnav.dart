import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/statemanager.dart';
import 'package:fokkkus/tabs/infotab.dart';
import 'package:fokkkus/tabs/timertab.dart';
import 'package:fokkkus/tabs/todotab.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _TimerPageState();
}

class _TimerPageState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppStateManager(),
      child: _BottomNavContent(),
    );
  }
}

class _BottomNavContent extends StatelessWidget {
  final List<Widget> _pages = [
    const TimerTab(),
    const ToDoTab(),
    const InfoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return Scaffold(
          body: Stack(
            children: [
              for (int i = 0; i < _pages.length; i++)
                AnimatedOpacity(
                  opacity: appStateManager.selectedIndex == i ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: _pages[i],
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: FlashyTabBar(
                  backgroundColor: const Color(0xFFFAF9FA),
                  animationCurve: Curves.linear,
                  selectedIndex: appStateManager.selectedIndex,
                  showElevation: false,
                  onItemSelected: (index) {
                    appStateManager.setTabIndex(index);
                  },
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
              ),
            ],
          ),
        );
      },
    );
  }
}
