import 'package:cubeincubation_mobile_hackathon_2025/controllers/get_started_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_started_event.dart';
import 'get_started_state.dart';

class GetStartedBloc extends Bloc<GetStartedEvent, GetStartedState> {
  final GetStartedController controller;

  GetStartedBloc(this.controller) : super(GetStartedInitial()) {
    on<GetStartedButtonPressed>((event, emit) {
      controller.onStart();
      emit(GetStartedNavigating());
    });
  }
}
