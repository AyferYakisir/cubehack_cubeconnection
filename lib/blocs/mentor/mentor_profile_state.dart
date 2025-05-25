import 'package:equatable/equatable.dart';

class MentorProfileState extends Equatable {
  const MentorProfileState();

  @override
  List<Object> get props => [];
}

class MentorProfileInitial extends MentorProfileState {}

class MentorProfileSubmitting extends MentorProfileState {}

class MentorProfileSuccess extends MentorProfileState {}

class MentorProfileFailure extends MentorProfileState {
  final String error;

  const MentorProfileFailure(this.error);

  @override
  List<Object> get props => [error];
}
