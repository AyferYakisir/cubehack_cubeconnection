import 'package:cubeincubation_mobile_hackathon_2025/models/investment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'investor_event.dart';
import 'investor_state.dart';

class InvestorBloc extends Bloc<InvestorEvent, InvestorState> {
  InvestorBloc() : super(InvestorLoading()) {
    on<LoadInvestments>((event, emit) {
      final data = [
        InvestmentModel(
          company: 'A FİRMASI',
          amount: '100.000',
          date: '22 Mayıs',
          imagePath: 'assets/images/foto1.jpeg',
        ),
        InvestmentModel(
          company: 'B FİRMASI',
          amount: '70.000',
          date: '22 Mayıs',
          imagePath: 'assets/images/foto2.jpeg',
        ),
      ];
      emit(InvestorLoaded(data));
    });
  }
}
