import 'package:flutter/material.dart';

abstract class MeetingCreateEvent {}

class SelectTable extends MeetingCreateEvent {
  final int tableNumber;
  SelectTable(this.tableNumber);
}

class SelectTime extends MeetingCreateEvent {
  final TimeOfDay time;
  SelectTime(this.time);
}

class CreateMeeting extends MeetingCreateEvent {}
