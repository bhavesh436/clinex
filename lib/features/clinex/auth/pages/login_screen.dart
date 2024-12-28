import 'package:flutter/material.dart';

import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 54,
            left: 24,
            bottom: 24,
            right: 24,
          ),
          child: Column(
            children: [
              /// Header
              MyLoginHeader(),

              /// Form
              MyLoginForm(),



            ],
          ),
        ),
      ),
    );
  }
}