/// Top Banner Widget
/// 
/// A decorative banner card displayed at the top of the home screen.
/// Can be customized with text, colors, and icons.
/// 
/// Usage:
/// ```dart
/// TopBanner(
///   title: 'Welcome!',
///   subtitle: 'Today is a great day',
/// )
/// ```

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TopBanner extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Color? backgroundColor;

  const TopBanner({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.bannerBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 32,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: AppTheme.headingSmall.copyWith(
                      color: AppTheme.primaryColor,
                    ),
                  ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: AppTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
