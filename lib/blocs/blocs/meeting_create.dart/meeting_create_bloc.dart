import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting_create.dart/meeting_create_event.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting_create.dart/meeting_create_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeetingCreateBloc extends Bloc<MeetingCreateEvent, MeetingCreateState> {
  MeetingCreateBloc() : super(MeetingCreateState()) {
    on<SelectTable>((event, emit) {
      emit(state.copyWith(selectedTable: event.tableNumber));
    });

    on<SelectTime>((event, emit) {
      emit(state.copyWith(selectedTime: event.time));
    });

    on<CreateMeeting>((event, emit) {
      // TODO: Save the meeting or trigger backend logic
    });
  }
}
