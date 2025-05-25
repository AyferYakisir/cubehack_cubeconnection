import 'package:cubeincubation_mobile_hackathon_2025/controllers/home_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeController controller;

  HomeBloc(this.controller) : super(HomeInitial()) {
    on<LoadInitiatives>((event, emit) {
      final all = controller.fetchInitiatives();
      emit(HomeLoaded(
        popular: all.where((i) => i.isPopular).toList(),
        recent: all.where((i) => !i.isPopular).toList(),
      ));
    });
  }
}
