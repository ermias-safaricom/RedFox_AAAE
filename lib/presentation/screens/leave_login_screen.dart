/// Login Screen
/// 
/// Login screen for the leave management system.
/// Features a centered logo, welcome text, username/password fields,
/// and a login button with footer copyright text.
/// 
/// This is separate from the existing e-commerce login screen and is
/// specific to the leave management feature.

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_button.dart';

class LeaveLoginScreen extends StatefulWidget {
  const LeaveLoginScreen({super.key});

  @override
  State<LeaveLoginScreen> createState() => _LeaveLoginScreenState();
}

class _LeaveLoginScreenState extends State<LeaveLoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate login delay
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
        });
        // Navigate to home screen
        Navigator.of(context).pushReplacementNamed('/home');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: AppTheme.primaryColor,
                  ),
                  const SizedBox(height: 40),

                  // Welcome Text
                  Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: AppTheme.headingLarge.copyWith(
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue',
                    textAlign: TextAlign.center,
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Username Field
                  CustomTextField(
                    controller: _usernameController,
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  CustomTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icons.lock_outline,
                    obscureText: true,
                    showPasswordToggle: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // Login Button
                  AuthButton(
                    text: 'Login',
                    onPressed: _isLoading ? null : _handleLogin,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 40),

                  // Footer Copyright
                  Text(
                    '© 2024 Leave Management System\nAll rights reserved',
                    textAlign: TextAlign.center,
                    style: AppTheme.caption,
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
