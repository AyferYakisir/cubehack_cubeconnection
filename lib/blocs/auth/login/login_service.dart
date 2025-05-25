import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth;

  LoginBloc({FirebaseAuth? auth})
      : _auth = auth ?? FirebaseAuth.instance,
        super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(error: e.message ?? 'Bilinmeyen hata'));
    } catch (e) {
      emit(LoginFailure(error: 'Hata: $e'));
    }
  }

  
}
