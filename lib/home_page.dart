import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fokkkus/statemanager.dart';
import 'package:fokkkus/tabs/infotab.dart';
import 'package:fokkkus/tabs/timertab.dart';
import 'package:fokkkus/tabs/todotab.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppStateManager(),
      child: _HomePageContext(),
    );
  }
}

class _HomePageContext extends StatefulWidget {
  @override
  State<_HomePageContext> createState() => _HomePageContextState();
}

class _HomePageContextState extends State<_HomePageContext> {
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

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Consumer<AppStateManager>(
          builder: (context, appStateManager, child) {
        return Scaffold(
          body: Stack(
            children: [
              for (int i = 0; i < _pages.length; i++)
                Offstage(
                  offstage: appStateManager.selectedIndex != i,
                  child: TickerMode(
                    enabled: appStateManager.selectedIndex == i,
                    child: _pages[i],
                  ),
                ),
            ],
            // children: _pages[appStateManager.selectedIndex],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   child: const Icon(Icons.add),
          // ),
          bottomNavigationBar:
              // isKeyboardVisible  ? const SizedBox() :
              FlashyTabBar(
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
        );
      });
    });
  }
}
