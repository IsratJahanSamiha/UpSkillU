import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'custom_widgets.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Image.asset('assets/eceleratelogo.png', height: 100, width: 180),
            const SizedBox(height: 20),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F70E8),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 18, color: Color(0xFF6F70E8)),
            ),
            const SizedBox(height: 20),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Enter email';
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                        return 'Enter valid email';
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Enter password';
                      if (value.length < 6) return 'Password min 6 chars';
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _confirmController,
                    hintText: "Confirm Password",
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Confirm password';
                      if (value != _passwordController.text)
                        return 'Passwords do not match';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Sign Up",
                    isLoading: authProvider.isLoading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authProvider.signup(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          context,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LogIn()),
                    ),
                    child: const Text(
                      "Already have an account? Log In",
                      style: TextStyle(color: Color(0xFF9596C4)),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    "UpSkillU",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6F70E8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
