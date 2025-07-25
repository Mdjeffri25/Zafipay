import 'package:flutter/material.dart';
import 'pinsetup_confirmation_screen.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final List<String> _pin = [];
  static const int pinLength = 4;

  void _addDigit(String digit) {
    if (_pin.length < pinLength) {
      setState(() {
        _pin.add(digit);
      });
    }
  }

  void _onSubmitPin() {
    if (_pin.length == pinLength) {
      // Navigate to PIN setup confirmation screen, passing the entered PIN
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PinSetupConfirmationScreen(pin: _pin.join()),
        ),
      );
    }
  }

  Widget _buildPinIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pinLength,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index < _pin.length ? Colors.black : Colors.transparent,
            border: Border.all(color: Colors.grey, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(String value, {VoidCallback? onPressed}) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(shape: const CircleBorder()),
        child: value == '>'
            ? const Icon(Icons.arrow_forward, size: 28, color: Colors.black)
            : Text(
                value,
                style: const TextStyle(fontSize: 28, color: Colors.black),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      [' ', '0', '>'],
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF1EBED),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 44),
            const Center(
              child: Text(
                "Let's  setup your PIN",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildPinIndicator(),
            const SizedBox(height: 48),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (rowIdx) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (colIdx) {
                      String val = keyboard[rowIdx][colIdx];
                      if (val == ' ') {
                        return const SizedBox(width: 60, height: 60);
                      } else if (val == '>') {
                        return _buildKeyboardButton(
                          val,
                          onPressed: _pin.length == pinLength
                              ? _onSubmitPin
                              : null,
                        );
                      } else {
                        return _buildKeyboardButton(
                          val,
                          onPressed: () => _addDigit(val),
                        );
                      }
                    }),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
