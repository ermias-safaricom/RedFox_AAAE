/// Sample Data for Leave Management System
/// 
/// This file contains mock data used for demonstration purposes.
/// Replace with actual API calls when backend is integrated.

class LeaveData {
  final String leave;
  final String fh;
  final String days;
  final String dateRange;

  const LeaveData({
    required this.leave,
    required this.fh,
    required this.days,
    required this.dateRange,
  });

  Map<String, String> toMap() {
    return {
      'leave': leave,
      'fh': fh,
      'days': days,
      'dateRange': dateRange,
    };
  }

  factory LeaveData.fromMap(Map<String, String> map) {
    return LeaveData(
      leave: map['leave']!,
      fh: map['fh']!,
      days: map['days']!,
      dateRange: map['dateRange']!,
    );
  }
}

/// Sample leave data for demonstration
class SampleLeaveData {
  static final List<LeaveData> leaveRequests = [
    const LeaveData(
      leave: 'Annual Leave',
      fh: 'FH1',
      days: '5',
      dateRange: '01/12 - 05/12',
    ),
    const LeaveData(
      leave: 'Sick Leave',
      fh: 'FH2',
      days: '2',
      dateRange: '10/12 - 11/12',
    ),
    const LeaveData(
      leave: 'Casual Leave',
      fh: 'FH1',
      days: '3',
      dateRange: '15/12 - 17/12',
    ),
    const LeaveData(
      leave: 'Annual Leave',
      fh: 'FH3',
      days: '7',
      dateRange: '20/12 - 27/12',
    ),
    const LeaveData(
      leave: 'Sick Leave',
      fh: 'FH2',
      days: '1',
      dateRange: '28/12',
    ),
    const LeaveData(
      leave: 'Casual Leave',
      fh: 'FH1',
      days: '4',
      dateRange: '01/01 - 04/01',
    ),
  ];

  /// Get list of leave data as maps for compatibility
  static List<Map<String, String>> get leaveRequestsAsMaps {
    return leaveRequests.map((data) => data.toMap()).toList();
  }
}
