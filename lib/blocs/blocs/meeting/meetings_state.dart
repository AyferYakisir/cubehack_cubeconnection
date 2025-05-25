import 'package:cubeincubation_mobile_hackathon_2025/models/meeting_model.dart';

abstract class MeetingsState {}

class MeetingsLoading extends MeetingsState {}

class MeetingsLoaded extends MeetingsState {
  final List<MeetingModel> meetings;
  MeetingsLoaded(this.meetings);
}
