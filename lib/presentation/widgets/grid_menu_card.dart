/// Grid Menu Card Widget
/// 
/// A reusable card component for displaying menu items in a grid layout.
/// Used in the home screen to show different menu options with icons and labels.
/// 
/// Usage:
/// ```dart
/// GridMenuCard(
///   icon: Icons.calendar_today,
///   label: 'Leave Request',
///   onTap: () => navigateToLeave(),
/// )
/// ```

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GridMenuCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const GridMenuCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: AppTheme.cardDecoration.copyWith(
            color: backgroundColor ?? AppTheme.cardBackground,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: iconColor ?? AppTheme.primaryColor,
              ),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
