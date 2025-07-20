import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/launch_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/forgot_password_screen.dart';

void main() {
  runApp(const ZafiPayApp());
}

class ZafiPayApp extends StatelessWidget {
  const ZafiPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zafi Pay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Arial'),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/launch': (context) => const LaunchScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/verify': (context) => const VerificationScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        
      },
    );
  }
}