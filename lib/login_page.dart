import 'package:flutter/material.dart';
import 'package:fokkkus/services/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                // signInWithGoogle();
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(child: CircularProgressIndicator());
                    });

                Authentication().signInWithGoogle();

                Navigator.pop(context);
              },
              child: const Text("Login with Google"))),
    );
  }
}
