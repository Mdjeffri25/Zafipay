import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth < 500 ? screenWidth * 0.95 : 400,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TextField(decoration: InputDecoration(labelText: 'Name')),
                const TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (_) {}),
                    const Flexible(
                      child: Text.rich(
                        TextSpan(
                          text: 'By signing up, you agree to the ',
                          children: [
                            TextSpan(
                              text: 'Terms of Service and Privacy Policy',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/verify');
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  icon: const Icon(Icons.g_mobiledata, size: 28),
                  label: const Text('Sign Up with Google'),
                  onPressed: () async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  try {
    final account = await googleSignIn.signIn();
    if (account != null) {
      Navigator.pushReplacementNamed(context, '/verify');
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Google sign-in failed: $error')),
    );
  }
},
                ),
                const SizedBox(height: 12),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: const Text(
                      'Already have an account? Login',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}