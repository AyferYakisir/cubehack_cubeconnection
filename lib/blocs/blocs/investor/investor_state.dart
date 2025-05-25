import 'package:cubeincubation_mobile_hackathon_2025/models/investment_model.dart';

abstract class InvestorState {}

class InvestorLoading extends InvestorState {}

class InvestorLoaded extends InvestorState {
  final List<InvestmentModel> investments;

  InvestorLoaded(this.investments);
}
