import 'package:cubeincubation_mobile_hackathon_2025/models/initiative_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<InitiativeModel> popular;
  final List<InitiativeModel> recent;

  HomeLoaded({required this.popular, required this.recent});
}
