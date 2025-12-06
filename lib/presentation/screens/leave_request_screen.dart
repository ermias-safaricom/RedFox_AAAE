/// Leave Request Screen
/// 
/// Screen for viewing and managing leave requests.
/// Features an app bar with back navigation, a "Request Leave" button,
/// and a table-like list of leave entries with pagination support.
/// 
/// Customize sample data by editing the _sampleLeaveData list.

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/leave_list_item.dart';
import '../widgets/request_leave_dialog.dart';
import '../widgets/auth_button.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  // Sample leave data
  final List<Map<String, String>> _leaveData = [
    {
      'leave': 'Annual Leave',
      'fh': 'FH1',
      'days': '5',
      'dateRange': '01/12 - 05/12',
    },
    {
      'leave': 'Sick Leave',
      'fh': 'FH2',
      'days': '2',
      'dateRange': '10/12 - 11/12',
    },
    {
      'leave': 'Casual Leave',
      'fh': 'FH1',
      'days': '3',
      'dateRange': '15/12 - 17/12',
    },
    {
      'leave': 'Annual Leave',
      'fh': 'FH3',
      'days': '7',
      'dateRange': '20/12 - 27/12',
    },
    {
      'leave': 'Sick Leave',
      'fh': 'FH2',
      'days': '1',
      'dateRange': '28/12',
    },
    {
      'leave': 'Casual Leave',
      'fh': 'FH1',
      'days': '4',
      'dateRange': '01/01 - 04/01',
    },
  ];

  void _showRequestLeaveDialog() {
    showDialog(
      context: context,
      builder: (context) => RequestLeaveDialog(
        onSubmit: (data) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Leave request submitted: ${data['leaveType']}'),
              backgroundColor: AppTheme.successColor,
            ),
          );
        },
      ),
    );
  }

  void _handleCancelLeave(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Leave'),
        content: const Text('Are you sure you want to cancel this leave request?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _leaveData.removeAt(index);
              });
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Leave request cancelled'),
                  backgroundColor: AppTheme.errorColor,
                ),
              );
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Leave Request'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: AuthButton(
              text: 'Request Leave',
              onPressed: _showRequestLeaveDialog,
              width: 140,
              height: 40,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.primaryColor,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Leave',
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    'FH',
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    'Days',
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Date Range',
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 80,
                  child: Text(
                    'Action',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // Leave list
          Expanded(
            child: _leaveData.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy,
                          size: 64,
                          color: AppTheme.textLight,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No leave requests',
                          style: AppTheme.bodyMedium.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _leaveData.length,
                    itemBuilder: (context, index) {
                      final leave = _leaveData[index];
                      return LeaveListItem(
                        leaveName: leave['leave']!,
                        fh: leave['fh']!,
                        days: leave['days']!,
                        dateRange: leave['dateRange']!,
                        isEvenRow: index % 2 == 1,
                        onCancel: () => _handleCancelLeave(index),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
