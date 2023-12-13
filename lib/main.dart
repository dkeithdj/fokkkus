import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/pages/auth_page.dart';
import 'package:fokkkus/services/auth_service.dart';
import 'package:fokkkus/services/firebase_service.dart';
import 'package:fokkkus/services/todo_service.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';
import "package:flutter/rendering.dart";
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:fokkkus/timertab_components/event/provider.dart';
import 'package:provider/provider.dart';

GetIt locator = GetIt.instance;

void setupSingletons() async {
  locator.registerLazySingleton<FirebaseService>(() => FirebaseService());
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<TodoService>(() => TodoService());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPaintSizeEnabled = false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupSingletons();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SliderValuesProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FOKKKUS",
      home: const SplashScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // add a variable that checks if user is logged in or not
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;

    return AnimatedSplashScreen(
      splash: Column(children: [
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
        )
      ]),
      backgroundColor: themeData.colorScheme.background,
      nextScreen: const AuthPage(),
      splashIconSize: 250,
    );
  }
}
