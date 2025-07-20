import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Username'),
                    onSaved: (value) => _username = value ?? '',
                    validator: (value) => value != null && value.isNotEmpty
                        ? null
                        : 'Enter your username',
                  ),
                  const SizedBox(height: 16),
                  // ...existing code...
TextFormField(
  decoration: const InputDecoration(labelText: 'Password'),
  obscureText: true,
  onSaved: (value) => _password = value ?? '',
  validator: (value) => value != null && value.length >= 6
      ? null
      : 'Password too short',
),
const SizedBox(height: 8),
Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () {
  Navigator.pushNamed(context, '/forgot');
},
    child: const Text('Forgot Password?'),
  ),
),
const SizedBox(height: 24),
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      print('Username: $_username, Password: $_password');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logging in...')),
      );
    }
  },
  child: const Text('Login'),
),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
