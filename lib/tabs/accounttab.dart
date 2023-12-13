import 'package:flutter/material.dart';
import 'package:fokkkus/accounttab_components/pomodoro_info.dart';
import 'package:fokkkus/accounttab_components/story_info.dart';
import 'package:fokkkus/accounttab_components/team_info.dart';
import 'package:fokkkus/services/auth_service.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      color: themeData.colorScheme.background,
      height: deviceHeight,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: themeData.textTheme.displayMedium?.color,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(child: AccountContainer()),
            const SizedBox(
              height: 15,
            ),
            Text(
              'About FoKKKus',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: themeData.textTheme.displayMedium?.color,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: AboutFokkkusContainer(),
            ),
            const Spacer(),
            Center(
              child: Text(
                'Version 1.2.3',
                style: TextStyle(
                  color: themeData.textTheme.displayMedium?.color,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutFokkkusContainer extends StatelessWidget {
  const AboutFokkkusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .textTheme
                  .displayLarge
                  ?.color ??
              const Color(0xFFFAF9FA)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const PomodoroInfo(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutQuart;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                ),
              );
            },
            child: Row(
              children: [
                SizedBox(
                  child: Image.asset(
                    isDarkMode
                        ? 'lib/accounttab_components/icons/pomodoro-dark.png'
                        : 'lib/accounttab_components/icons/pomodoro-light.png',
                    width: 22,
                    height: 22,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'The Pomodoro Technique',
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .textTheme
                              .titleLarge
                              ?.color ??
                          const Color(0xFF2E232F),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300),
                ),
                const Expanded(child: Text('')),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.keyboard_arrow_right_rounded,
                      size: 30,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .iconTheme
                          .color),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 1.5,
            color: const Color(0xFFE4E0E5),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const TeamInfo(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutQuart;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                ),
              );
            },
            child: Row(
              children: [
                SizedBox(
                  child: Image.asset(
                    isDarkMode
                        ? 'lib/accounttab_components/icons/team-info-dark.png'
                        : 'lib/accounttab_components/icons/team-info-light.png',
                    width: 22,
                    height: 22,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Our Team',
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .textTheme
                              .titleLarge
                              ?.color ??
                          const Color(0xFF2E232F),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300),
                ),
                const Expanded(child: Text('')),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.keyboard_arrow_right_rounded,
                      size: 30,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .iconTheme
                          .color),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 1.5,
            color: const Color(0xFFE4E0E5),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const StoryInfo(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutQuart;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                ),
              );
            },
            child: Row(
              children: [
                SizedBox(
                  child: Image.asset(
                    isDarkMode
                        ? 'lib/accounttab_components/icons/info-dark.png'
                        : 'lib/accounttab_components/icons/info-light.png',
                    width: 22,
                    height: 22,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Story Behing KKK',
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .textTheme
                              .titleLarge
                              ?.color ??
                          const Color(0xFF2E232F),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300),
                ),
                const Expanded(child: Text('')),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.keyboard_arrow_right_rounded,
                      size: 30,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .iconTheme
                          .color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountContainer extends StatelessWidget {
  const AccountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();
    final AuthService _authService = GetIt.I.get<AuthService>();
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .textTheme
                  .displayLarge
                  ?.color ??
              const Color(0xFFFAF9FA),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    'lib/accounttab_components/images/tep.png',
                    width: 70,
                    height: 70,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //user account name here
                      'Stephanie Palero',
                      style: TextStyle(
                        color: Provider.of<ThemeProvider>(context)
                                .themeData
                                .textTheme
                                .titleLarge
                                ?.color ??
                            const Color(0xFF2E232F),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      //user created date here
                      'Since January 2023',
                      style: TextStyle(
                        color: Provider.of<ThemeProvider>(context)
                                .themeData
                                .textTheme
                                .titleLarge
                                ?.color ??
                            const Color(0xFF2E232F),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              height: 1,
              color: const Color(0xFFE4E0E5),
            ),
            const SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {
                // _firebaseService.signOut();
                _authService.signOut();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Log Out',
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .textTheme
                              .titleLarge
                              ?.color ??
                          const Color(0xFF2E232F),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.keyboard_arrow_right_rounded,
                        size: 30,
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .iconTheme
                            .color),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
