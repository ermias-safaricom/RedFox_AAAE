/// Request Leave Dialog Widget
/// 
/// A modal dialog for submitting leave requests.
/// Includes fields for leave type, days, state, from date, and a submit button.
/// 
/// Usage:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => RequestLeaveDialog(
///     onSubmit: (data) => handleSubmit(data),
///   ),
/// )
/// ```

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RequestLeaveDialog extends StatefulWidget {
  final Function(Map<String, dynamic>)? onSubmit;

  const RequestLeaveDialog({
    super.key,
    this.onSubmit,
  });

  @override
  State<RequestLeaveDialog> createState() => _RequestLeaveDialogState();
}

class _RequestLeaveDialogState extends State<RequestLeaveDialog> {
  String? _selectedLeaveType;
  String? _selectedLeaveState;
  DateTime? _fromDate;
  final _daysController = TextEditingController(text: '0');
  late final TextEditingController _dateDisplayController;

  final List<String> _leaveTypes = [
    'Annual Leave',
    'Sick Leave',
    'Casual Leave',
    'Maternity Leave',
    'Paternity Leave',
  ];

  final List<String> _leaveStates = [
    'Full Day',
    'Half Day',
    'Quarter Day',
  ];

  @override
  void initState() {
    super.initState();
    _dateDisplayController = TextEditingController();
  }

  @override
  void dispose() {
    _daysController.dispose();
    _dateDisplayController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fromDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppTheme.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;
        _dateDisplayController.text = 
            '${picked.day.toString().padLeft(2, '0')}/'
            '${picked.month.toString().padLeft(2, '0')}/'
            '${picked.year}';
      });
    }
  }

  void _handleSubmit() {
    if (_selectedLeaveType == null ||
        _selectedLeaveState == null ||
        _fromDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    final data = {
      'leaveType': _selectedLeaveType,
      'days': _daysController.text,
      'leaveState': _selectedLeaveState,
      'fromDate': _fromDate,
    };

    if (widget.onSubmit != null) {
      widget.onSubmit!(data);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Request Leave',
                  style: AppTheme.headingSmall,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Leave Type Dropdown
            DropdownButtonFormField<String>(
              value: _selectedLeaveType,
              decoration: AppTheme.inputDecoration(
                labelText: 'Leave Type',
              ),
              items: _leaveTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type, style: AppTheme.bodyMedium),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLeaveType = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Days Display
            TextFormField(
              controller: _daysController,
              decoration: AppTheme.inputDecoration(
                labelText: 'Days',
              ),
              keyboardType: TextInputType.number,
              style: AppTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // Leave State Dropdown
            DropdownButtonFormField<String>(
              value: _selectedLeaveState,
              decoration: AppTheme.inputDecoration(
                labelText: 'Leave State',
              ),
              items: _leaveStates.map((state) {
                return DropdownMenuItem(
                  value: state,
                  child: Text(state, style: AppTheme.bodyMedium),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLeaveState = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // From Date Picker
            InkWell(
              onTap: () => _selectDate(context),
              child: IgnorePointer(
                child: TextFormField(
                  decoration: AppTheme.inputDecoration(
                    labelText: 'From Date',
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  controller: _dateDisplayController,
                  style: AppTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
