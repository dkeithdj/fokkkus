import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/login_page.dart';
import 'package:fokkkus/pages/auth_page.dart';
import 'package:fokkkus/pages/home.dart';
import 'package:fokkkus/pages/sign_in.dart';
import 'firebase_options.dart';
import "package:flutter/rendering.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPaintSizeEnabled = false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fokkkus',
        theme: ThemeData(
            primarySwatch: Colors.indigo, brightness: Brightness.dark),
        home: const AuthPage());
  }
}
