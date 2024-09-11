import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'LoginScreen';
  static const String link = '/$name';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Login...... en construccion"),
        ),
      ),
    );
  }
}