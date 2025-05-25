import 'package:equatable/equatable.dart';

class MentorProfileEvent extends Equatable {
  const MentorProfileEvent();

  @override
  List<Object> get props => [];
}

class SubmitMentorProfile extends MentorProfileEvent {
  final String name;
  final String email;
  final String password;
  final String expertise;
  final String mentorshipExperience;
  final String linkedin;
  final String freeTime;
  final String targetAudience;
  final String experienceSummary;

  const SubmitMentorProfile({
    required this.name,
    required this.email,
    required this.password,
    required this.expertise,
    required this.mentorshipExperience,
    required this.linkedin,
    required this.freeTime,
    required this.targetAudience,
    required this.experienceSummary,
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
        expertise,
        mentorshipExperience,
        linkedin,
        freeTime,
        targetAudience,
        experienceSummary,
      ];
}
