/// Demo Entry Point for Leave Management System
/// 
/// This is a standalone entry point for testing the leave management screens.
/// Run with: flutter run -t lib/leave_main.dart
/// 
/// This allows testing the new screens without modifying the existing e-commerce app.

import 'package:flutter/material.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/theme/app_theme.dart';

void main() {
  runApp(const LeaveManagementApp());
}

class LeaveManagementApp extends StatelessWidget {
  const LeaveManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leave Management System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.login,
    );
  }
}
