import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/statemanager.dart';
import 'package:fokkkus/tabs/infotab.dart';
import 'package:fokkkus/tabs/timertab.dart';
import 'package:fokkkus/tabs/todotab.dart';
import 'package:fokkkus/theme/themeprovider.dart';
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

class _BottomNavContent extends StatefulWidget {
  @override
  State<_BottomNavContent> createState() => _BottomNavContentState();
}

class _BottomNavContentState extends State<_BottomNavContent> {
  final List<Widget> _pages = [
    const TimerTab(),
    const ToDoTab(),
    const InfoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;

    TextStyle customTextStyle = TextStyle(
      color: themeData.textTheme.titleLarge?.color,
      fontWeight: FontWeight.w500,
    );

    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return Scaffold(
          backgroundColor: themeData.colorScheme.background,
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
                  backgroundColor: themeData.colorScheme.background,
                  animationCurve: Curves.linear,
                  selectedIndex: appStateManager.selectedIndex,
                  showElevation: false,
                  onItemSelected: (index) {
                    appStateManager.setTabIndex(index);
                  },
                  items: [
                    FlashyTabBarItem(
                      activeColor: themeData.textTheme.titleLarge?.color ??
                          const Color(0xFF2E232F),
                      icon: Image.asset(
                        'lib/icons/timer.png',
                        width: 30,
                        height: 30,
                        color: const Color(0xFF999999),
                      ),
                      title: Text(
                        'Timer',
                        style: customTextStyle,
                      ),
                    ),
                    FlashyTabBarItem(
                      activeColor: themeData.textTheme.titleLarge?.color ??
                          const Color(0xFF2E232F),
                      icon: Image.asset(
                        'lib/icons/to-do.png',
                        width: 30,
                        height: 30,
                        color: const Color(0xFF999999),
                      ),
                      title: Text(
                        'To-Do List',
                        style: customTextStyle,
                      ),
                    ),
                    FlashyTabBarItem(
                      activeColor: themeData.textTheme.titleLarge?.color ??
                          const Color(0xFF2E232F),
                      icon: Image.asset(
                        'lib/icons/info.png',
                        width: 30,
                        height: 30,
                        color: const Color(0xFF999999),
                      ),
                      title: Text(
                        'Info',
                        style: customTextStyle,
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
