/// Leave List Item Widget
/// 
/// A widget representing a single row in the Leave Request list.
/// Displays leave information including type, FH, days, date range, and action button.
/// 
/// Usage:
/// ```dart
/// LeaveListItem(
///   leaveName: 'Annual Leave',
///   fh: 'FH1',
///   days: '5',
///   dateRange: '01/12 - 05/12',
///   onCancel: () => handleCancel(),
/// )
/// ```

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LeaveListItem extends StatelessWidget {
  final String leaveName;
  final String fh;
  final String days;
  final String dateRange;
  final VoidCallback? onCancel;
  final bool isEvenRow;

  const LeaveListItem({
    super.key,
    required this.leaveName,
    required this.fh,
    required this.days,
    required this.dateRange,
    this.onCancel,
    this.isEvenRow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: isEvenRow ? Colors.grey[50] : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppTheme.dividerColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Leave name
          Expanded(
            flex: 2,
            child: Text(
              leaveName,
              style: AppTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // FH
          SizedBox(
            width: 50,
            child: Text(
              fh,
              style: AppTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          // Days
          SizedBox(
            width: 50,
            child: Text(
              days,
              style: AppTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          // Date Range
          Expanded(
            flex: 2,
            child: Text(
              dateRange,
              style: AppTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          // Action button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: onCancel,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accentColor,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                minimumSize: const Size(0, 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
