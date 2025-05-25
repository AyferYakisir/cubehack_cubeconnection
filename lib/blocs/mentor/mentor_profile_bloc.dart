import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mentor_profile_event.dart';
import 'mentor_profile_state.dart';

class MentorProfileBloc extends Bloc<MentorProfileEvent, MentorProfileState> {
  MentorProfileBloc() : super(MentorProfileInitial()) {
    on<SubmitMentorProfile>(_onSubmit);
  }

  Future<void> _onSubmit(
      SubmitMentorProfile event, Emitter<MentorProfileState> emit) async {
    emit(MentorProfileSubmitting());

    try {
      await FirebaseFirestore.instance.collection('mentors').add({
        'name': event.name,
        'email': event.email,
        'password': event.password,
        'expertise': event.expertise,
        'mentorshipExperience': event.mentorshipExperience,
        'linkedin': event.linkedin,
        'freeTime': event.freeTime,
        'targetAudience': event.targetAudience,
        'experienceSummary': event.experienceSummary,
        'createdAt': Timestamp.now(),
      });

      emit(MentorProfileSuccess());
    } catch (e) {
      emit(MentorProfileFailure(e.toString()));
    }
  }
}
