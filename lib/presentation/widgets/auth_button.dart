/// Auth Button Widget
/// 
/// A reusable button component for authentication and form actions.
/// Supports loading states, enabled/disabled states, and custom styling.
/// 
/// Usage:
/// ```dart
/// AuthButton(
///   text: 'Login',
///   onPressed: () => handleLogin(),
///   isLoading: isLoading,
/// )
/// ```

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? width;
  final double height;

  const AuthButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;
    
    if (isOutlined) {
      return SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: OutlinedButton(
          onPressed: isEnabled ? onPressed : null,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: isEnabled
                  ? (backgroundColor ?? AppTheme.primaryColor)
                  : AppTheme.borderColor,
              width: 1.5,
            ),
          ),
          child: _buildButtonChild(
            textColor: backgroundColor ?? AppTheme.primaryColor,
          ),
        ),
      );
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppTheme.primaryColor,
          disabledBackgroundColor: AppTheme.borderColor,
        ),
        child: _buildButtonChild(
          textColor: textColor ?? Colors.white,
        ),
      ),
    );
  }

  Widget _buildButtonChild({required Color textColor}) {
    if (isLoading) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: textColor),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTheme.buttonText.copyWith(color: textColor),
          ),
        ],
      );
    }

    return Text(
      text,
      style: AppTheme.buttonText.copyWith(color: textColor),
    );
  }
}
