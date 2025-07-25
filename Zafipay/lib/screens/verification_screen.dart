import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers = List.generate(
      6,
      (_) => TextEditingController(),
    );
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
          children: [
            const Text(
              "Enter your Verification Code",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                6,
                (index) => Container(
                  width: 36,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextField(
                    controller: controllers[index],
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text("04:59", style: TextStyle(color: Colors.purple)),
            const SizedBox(height: 12),
            const Text(
              "We send verification code to your email zafi*@gmail.com. You can check your inbox.",
            ),
            const SizedBox(height: 8),
            const Text(
              "I didn't receive the code? Send again",
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String code = controllers.map((c) => c.text).join();
                  // Add your verification logic here
                  print('Entered code: $code');
                },
                child: const Text("Verify"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
