import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting_create.dart/meeting_create_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting_create.dart/meeting_create_event.dart';
import 'package:flutter/material.dart';

class MeetingCreateController {
  void selectTable(int table, MeetingCreateBloc bloc) {
    bloc.add(SelectTable(table));
  }

  void selectTime(TimeOfDay time, MeetingCreateBloc bloc) {
    bloc.add(SelectTime(time));
  }

  void createMeeting(MeetingCreateBloc bloc) {
    bloc.add(CreateMeeting());
  }
}
