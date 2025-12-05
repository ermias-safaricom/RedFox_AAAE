import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lyqx_challange/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    _checkTokenAndNavigate();
  }

  Future<void> _checkTokenAndNavigate() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final token = sharedPreferences.getString(AppConstants.tokenKey);
    print("token: $token");
    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (token != null && token.isNotEmpty) {
        context.go('/products');
      } else {
        context.go('/welcome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
