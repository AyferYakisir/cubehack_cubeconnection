import 'package:flutter/material.dart';

class MeetingCreateState {
  final int? selectedTable;
  final TimeOfDay? selectedTime;

  MeetingCreateState({this.selectedTable, this.selectedTime});

  MeetingCreateState copyWith({int? selectedTable, TimeOfDay? selectedTime}) {
    return MeetingCreateState(
      selectedTable: selectedTable ?? this.selectedTable,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}
