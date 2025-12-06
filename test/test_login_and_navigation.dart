/// Test for Login and Navigation Flow
/// 
/// Tests the basic navigation flow from Login -> Home -> Leave Request
/// for the leave management system screens.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyqx_challange/presentation/screens/leave_login_screen.dart';
import 'package:lyqx_challange/presentation/screens/home_screen.dart';
import 'package:lyqx_challange/presentation/screens/leave_request_screen.dart';
import 'package:lyqx_challange/presentation/routes/app_routes.dart';

void main() {
  group('Leave Management Navigation Tests', () {
    testWidgets('Login screen renders correctly', (WidgetTester tester) async {
      // Build the login screen
      await tester.pumpWidget(
        MaterialApp(
          home: const LeaveLoginScreen(),
          routes: AppRoutes.routes,
        ),
      );

      // Verify the login screen elements are present
      expect(find.text('Welcome!'), findsOneWidget);
      expect(find.text('Sign in to continue'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('Can navigate from Login to Home', (WidgetTester tester) async {
      // Build the app with routes
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: AppRoutes.login,
          routes: AppRoutes.routes,
        ),
      );

      // Verify we're on the login screen
      expect(find.text('Welcome!'), findsOneWidget);

      // Enter credentials
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Username'),
        'testuser',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password'),
        'password123',
      );

      // Tap login button
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify navigation to home screen
      expect(find.text('HOME'), findsOneWidget);
      expect(find.text('Quick Access'), findsOneWidget);
    });

    testWidgets('Can navigate from Home to Leave Request', (WidgetTester tester) async {
      // Build the app starting at home
      await tester.pumpWidget(
        MaterialApp(
          home: const HomeScreen(),
          routes: AppRoutes.routes,
        ),
      );

      // Verify we're on the home screen
      expect(find.text('HOME'), findsOneWidget);

      // Find and tap the Leave Request card
      await tester.tap(find.text('Leave Request'));
      await tester.pumpAndSettle();

      // Verify navigation to leave request screen
      expect(find.text('Leave Request'), findsAtLeastNWidgets(1));
      expect(find.text('FH'), findsOneWidget);
      expect(find.text('Days'), findsOneWidget);
    });

    testWidgets('Leave Request screen renders correctly', (WidgetTester tester) async {
      // Build the leave request screen
      await tester.pumpWidget(
        const MaterialApp(
          home: LeaveRequestScreen(),
        ),
      );

      // Verify the leave request screen elements
      expect(find.text('Leave Request'), findsAtLeastNWidgets(1));
      expect(find.text('Request Leave'), findsOneWidget);
      expect(find.text('FH'), findsOneWidget);
      expect(find.text('Days'), findsOneWidget);
      expect(find.text('Date Range'), findsOneWidget);
      expect(find.text('Action'), findsOneWidget);
    });

    testWidgets('Can open request leave dialog', (WidgetTester tester) async {
      // Build the leave request screen
      await tester.pumpWidget(
        const MaterialApp(
          home: LeaveRequestScreen(),
        ),
      );

      // Tap the Request Leave button
      await tester.tap(find.text('Request Leave'));
      await tester.pumpAndSettle();

      // Verify dialog is shown
      expect(find.text('Leave Type'), findsOneWidget);
      expect(find.text('Leave State'), findsOneWidget);
      expect(find.text('From Date'), findsOneWidget);
      expect(find.text('SUBMIT'), findsOneWidget);
    });
  });
}
