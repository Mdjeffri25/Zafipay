import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _canNavigate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _canNavigate = true;
      });
    });
  }

  void _goToLaunchScreen() {
    if (_canNavigate) {
      Navigator.pushReplacementNamed(context, '/launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: _goToLaunchScreen,
        child: Center(
          child: Image.asset(
            'assets/splash_logo.png',
            width: 420,
            height: 420,
          ),
        ),
      ),
    );
  }
}
