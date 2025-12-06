/// App Routes
/// 
/// Defines named routes for the leave management system screens.
/// These routes are separate from the existing e-commerce routes
/// and provide navigation for the leave management feature.
/// 
/// Routes:
/// - '/' -> LeaveLoginScreen
/// - '/home' -> HomeScreen
/// - '/leave-request' -> LeaveRequestScreen
/// 
/// Usage in MaterialApp:
/// ```dart
/// MaterialApp(
///   routes: AppRoutes.routes,
///   initialRoute: AppRoutes.login,
/// )
/// ```

import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/leave_request_screen.dart';

class AppRoutes {
  // Route names
  static const String login = '/';
  static const String home = '/home';
  static const String leaveRequest = '/leave-request';

  // Route map
  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => const LeaveLoginScreen(),
      home: (context) => const HomeScreen(),
      leaveRequest: (context) => const LeaveRequestScreen(),
    };
  }

  // Helper method to navigate to a route
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  // Helper method to replace current route
  static void replaceTo(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  // Helper method to pop and navigate
  static void popAndNavigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(routeName);
  }
}
