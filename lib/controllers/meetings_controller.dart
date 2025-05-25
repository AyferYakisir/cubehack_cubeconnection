import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting/meeting_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting/meetings_event.dart';

class MeetingsController {
  void toggleFavorite(int index, MeetingsBloc bloc) {
    bloc.add(ToggleFavorite(index));
  }
}
