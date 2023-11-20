import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FOKKKUS",
      theme: ThemeData(
        primaryColor: const Color(0xFFFAF9FA),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(children: [
        Image.asset(
          '../lib/images/logo.png',
          fit: BoxFit.fitWidth,
          width: 130,
          height: 130,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'FOKKKUS',
          style: GoogleFonts.poppins(
            color: const Color(0xFF735D78),
            fontSize: 40,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        Text(
          'Enhance Your Productivity',
          style: GoogleFonts.poppins(
            color: const Color(0xFF2E232F),
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 1.05,
          ),
        )
      ]),
      backgroundColor: const Color(0xFFFAF9FA),
      nextScreen: const Home(),
      splashIconSize: 250,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
    );
  }
}
