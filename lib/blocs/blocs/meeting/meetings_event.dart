abstract class MeetingsEvent {}

class LoadMeetings extends MeetingsEvent {}

class ToggleFavorite extends MeetingsEvent {
  final int index;
  ToggleFavorite(this.index);
}
