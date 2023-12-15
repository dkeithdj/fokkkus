import 'package:flutter/material.dart';
import 'package:fokkkus/components/google_sign_in_button.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'lib/images/logo.png',
            fit: BoxFit.fitWidth,
            width: 130,
            height: 130,
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'FOKKKUS',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF735D78),
              fontSize: 40,
              fontWeight: FontWeight.bold,
              height: 0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Enhance Your Productivity',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: themeData.textTheme.titleLarge?.color ??
                  const Color(0xFF2E232F),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 1.05,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const GoogleSignInButton()
        ]),
      ),
    );
  }
}
