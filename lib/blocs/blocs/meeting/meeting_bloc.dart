import 'package:cubeincubation_mobile_hackathon_2025/models/meeting_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'meetings_event.dart';
import 'meetings_state.dart';

class MeetingsBloc extends Bloc<MeetingsEvent, MeetingsState> {
  MeetingsBloc() : super(MeetingsLoading()) {
    on<LoadMeetings>((event, emit) {
      final meetings = List.generate(5, (i) {
        return MeetingModel(
          company: 'A Girişim',
          date: '22 Mayıs Çarşamba',
          table: '4 Numaralı Masa',
          status: i == 0 ? 'Toplantıya Kalan Süre: 3 Saat' : 'Toplantı Yapıldı',
        );
      });
      emit(MeetingsLoaded(meetings));
    });

    on<ToggleFavorite>((event, emit) {
      if (state is MeetingsLoaded) {
        final updated = List<MeetingModel>.from(
          (state as MeetingsLoaded).meetings,
        );
        updated[event.index].isFavorite = !updated[event.index].isFavorite;
        emit(MeetingsLoaded(updated));
      }
    });
  }
}
