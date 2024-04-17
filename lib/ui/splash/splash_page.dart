import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/login'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
          child: Container(
        width: 158,
        height: 154,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          'assets/pasya_logo.png',
        ))),
      )),
    );
  }
}
