# Leave Management System Integration

## Overview

This pull request adds a complete leave management system UI to the RedFox_AAAE Flutter application. The new screens and components are designed as a separate feature module that can be integrated into the existing e-commerce application.

## New Files Added

### Theme
- `lib/presentation/theme/app_theme.dart` - Centralized theme configuration with colors, text styles, and decorations

### Widgets (Reusable Components)
- `lib/presentation/widgets/custom_text_field.dart` - Customizable text input field
- `lib/presentation/widgets/auth_button.dart` - Reusable button with loading states
- `lib/presentation/widgets/grid_menu_card.dart` - Menu card for grid layouts
- `lib/presentation/widgets/leave_list_item.dart` - Leave request list item
- `lib/presentation/widgets/top_banner.dart` - Top banner component
- `lib/presentation/widgets/request_leave_dialog.dart` - Modal dialog for leave requests

### Screens
- `lib/presentation/screens/login_screen.dart` - Leave system login screen
- `lib/presentation/screens/home_screen.dart` - Dashboard with menu grid
- `lib/presentation/screens/leave_request_screen.dart` - Leave request management screen

### Routing
- `lib/presentation/routes/app_routes.dart` - Named routes for leave management screens

### Tests
- `test/test_login_and_navigation.dart` - Navigation and widget tests

## Integration Options

### Option 1: Standalone Leave Management App

To run the leave management system as a standalone app, update `lib/main.dart`:

```dart
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
```

### Option 2: Integrate with Existing E-commerce App

To add the leave management feature to the existing app:

1. **Add routes to GoRouter** in `lib/core/router/app_router.dart`:
```dart
import 'package:lyqx_challange/presentation/screens/login_screen.dart';
import 'package:lyqx_challange/presentation/screens/home_screen.dart';
import 'package:lyqx_challange/presentation/screens/leave_request_screen.dart';

// Add to routes list:
GoRoute(path: '/leave-login', builder: (context, state) => const LeaveLoginScreen()),
GoRoute(path: '/leave-home', builder: (context, state) => const HomeScreen()),
GoRoute(path: '/leave-request', builder: (context, state) => const LeaveRequestScreen()),
```

2. **Add a menu item** in the existing products screen to navigate to leave management:
```dart
// In products screen or main menu
ElevatedButton(
  onPressed: () => context.go('/leave-home'),
  child: const Text('Leave Management'),
)
```

### Option 3: Separate Entry Point

Create a separate entry point file for the leave management system:

1. Create `lib/leave_main.dart`:
```dart
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
```

2. Run with: `flutter run -t lib/leave_main.dart`

## Design Notes

The UI follows Material Design 3 principles with:
- **Primary Color**: Purple (#6C5CE7) for app bar and primary actions
- **Secondary Color**: Teal (#00B894) for success states
- **Accent Color**: Red (#FF6B6B) for cancel/delete actions
- **Responsive Grid**: Adapts to screen width (2-4 columns)
- **Consistent Spacing**: 8dp grid system
- **Card Shadows**: Subtle elevation for depth

## Features Implemented

1. **Login Screen**
   - Username and password fields with icons
   - Password visibility toggle
   - Form validation
   - Centered layout with logo

2. **Home Screen**
   - App bar with notifications and logout
   - Top banner for quick info
   - Responsive grid menu (2-4 columns)
   - Navigation to various sections

3. **Leave Request Screen**
   - Table-like list with alternating row colors
   - Request Leave button in app bar
   - Cancel action for each leave entry
   - Sample data included

4. **Request Leave Dialog**
   - Leave type dropdown
   - Days input
   - Leave state dropdown
   - Date picker
   - Form validation

## Testing

Run tests with:
```bash
flutter test test/test_login_and_navigation.dart
```

Or run all tests:
```bash
flutter test
```

## Future Enhancements

- [ ] Backend integration with API
- [ ] Authentication with JWT
- [ ] Real-time notifications
- [ ] Leave balance tracking
- [ ] Manager approval workflow
- [ ] Calendar view for leave requests
- [ ] Export to PDF/Excel
- [ ] Multi-language support

## Notes

- All new files follow the existing project structure (core/data/domain/presentation)
- No existing files were modified to prevent breaking changes
- UI matches the provided screenshots with responsive layouts
- Mock data is used for demonstration purposes
- Theme can be easily customized in `app_theme.dart`

## Screenshots

The implementation matches the provided reference images for:
- Login screen with centered logo and form
- Home screen with grid menu cards
- Leave request screen with table layout
- Request leave modal dialog

## Conflicts and Recommendations

**Naming Conflict**: There's an existing `login_screen.dart` in `lib/presentation/auth/screens/` for the e-commerce app. The new leave management login is at `lib/presentation/screens/login_screen.dart`.

**Recommendations**:
1. Keep both screens separate as they serve different purposes
2. Rename the new screen to `leave_login_screen.dart` if needed
3. Use the integration options above to avoid route conflicts
4. Consider creating a unified authentication system if both features will be used together

## Running the Leave Management System

To test the new screens without affecting the existing app, you can:

1. Temporarily update `lib/main.dart` to use the new routes (remember to restore it)
2. Use Option 3 above to create a separate entry point
3. Run individual screens in widget tests

All screens are fully functional with sample data and can be easily connected to a backend API in the future.
