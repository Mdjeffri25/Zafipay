import 'screens/account_setup_completion_screen.dart';
import 'screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/launch_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/pinsetup_screen.dart';
import 'screens/send_money_screen.dart';
import 'screens/receive_money_screen.dart';
// import 'screens/pin_confirmation_screen.dart';
// import 'screens/account_setup_screen.dart';
// import 'screens/pinsetup_confirmation_screen.dart';

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
        '/dashboard': (context) => const DashboardScreen(),
        '/pinsetup': (context) => const PinSetupScreen(),
        '/accountsetupcompletion': (context) =>
            const AccountSetupCompletionScreen(),
        '/profile': (context) => const UserProfileScreen(),
        '/sendmoney': (context) => const SendMoneyScreen(),
        '/receivemoney': (context) => const ReceiveMoneyScreen(),
        // '/accountsetup': (context) => const AccountSetupScreen(),
        // PinSetupConfirmationScreen is pushed with arguments, not by route name
        // PinConfirmationScreen is pushed with arguments, not by route name
      },
    );
  }
}
