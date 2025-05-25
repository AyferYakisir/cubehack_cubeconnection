import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  RegisterBloc({FirebaseAuth? auth, FirebaseFirestore? firestore})
      : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      final uid = userCredential.user!.uid;

      Map<String, dynamic> userData = {
        'uid': uid,
        'name': event.name,
        'email': event.email,
        'role': event.role,
        'createdAt': FieldValue.serverTimestamp(),
      };

      if (event.role == 'Girişimci') {
        userData.addAll({
          'startupName': event.field1,
          'startupStage': event.dropdownValue,
        });
      } else if (event.role == 'Yatırımcı') {
        userData.addAll({
          'investmentRange': event.field1,
          'interestSector': event.dropdownValue,
        });
      } else if (event.role == 'Mentör') {
        userData.addAll({
          'expertiseArea': event.field1,
          'mentorshipExperience': event.dropdownValue,
        });
      }

      await _firestore.collection('users').doc(uid).set(userData);
      await userCredential.user!.sendEmailVerification();

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(error: e.message ?? 'FirebaseAuthException'));
    } catch (e) {
      emit(RegisterFailure(error: 'Hata: $e'));
    }
  }
}
