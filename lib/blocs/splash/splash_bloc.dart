import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';
import '../../controllers/splash_controller.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashController controller;

  SplashBloc(this.controller) : super(SplashInitial()) {
    on<SplashStarted>((event, emit) async {
      await controller.waitForSplash(); // animasyon süresi kadar beklet
      emit(SplashFinished());
    });
  }
}
