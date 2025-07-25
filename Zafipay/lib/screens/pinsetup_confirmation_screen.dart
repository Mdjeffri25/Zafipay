import 'package:flutter/material.dart';
import 'account_setup_completion_screen.dart';

class PinSetupConfirmationScreen extends StatefulWidget {
  final String pin;
  const PinSetupConfirmationScreen({super.key, required this.pin});

  @override
  State<PinSetupConfirmationScreen> createState() =>
      _PinSetupConfirmationScreenState();
}

class _PinSetupConfirmationScreenState
    extends State<PinSetupConfirmationScreen> {
  final List<String> _confirmPin = [];
  static const int pinLength = 4;

  void _addDigit(String digit) {
    if (_confirmPin.length < pinLength) {
      setState(() {
        _confirmPin.add(digit);
      });
    }
  }

  void _onSubmitPin() {
    if (_confirmPin.length == pinLength) {
      if (_confirmPin.join() == widget.pin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountSetupCompletionScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PINs do not match. Please try again.')),
        );
        setState(() {
          _confirmPin.clear();
        });
      }
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
            color: index < _confirmPin.length
                ? Colors.black
                : Colors.transparent,
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
      ['<', '0', '>'], // '<' is the backspace button
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF1EBED),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 44),
            const Center(
              child: Text(
                "Confirm your PIN",
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
                      return _buildKeyboardButton(
                        val,
                        onPressed: () {
                          if (val == '<') {
                            if (_confirmPin.isNotEmpty) {
                              setState(() {
                                _confirmPin.removeLast();
                              });
                            }
                          } else if (val == '>') {
                            if (_confirmPin.length == pinLength) _onSubmitPin();
                          } else if (val != ' ') {
                            _addDigit(val);
                          }
                        },
                      );
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
