import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Enter your Verification Code",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text("0 0 _ _ _ _", style: TextStyle(fontSize: 24)),
            SizedBox(height: 12),
            Text("04:59", style: TextStyle(color: Colors.purple)),
            SizedBox(height: 12),
            Text(
              "We send verification code to your email zafi*@gmail.com. You can check your inbox.",
            ),
            SizedBox(height: 8),
            Text(
              "I didn't receive the code? Send again",
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(onPressed: null, child: Text("Verify")),
            ),
          ],
        ),
      ),
    );
  }
}
