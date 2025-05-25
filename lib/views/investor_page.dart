// view/investor_page.dart
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/investor/investor_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/investor/investor_event.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/investor/investor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvestorPage extends StatelessWidget {
  const InvestorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InvestorBloc()..add(LoadInvestments()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F0F0),
        body: BlocBuilder<InvestorBloc, InvestorState>(
          builder: (context, state) {
            if (state is InvestorLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.investments.length,
                itemBuilder: (context, index) {
                  final item = state.investments[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF94B4C1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.company,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text('Yapılan Yatırım: ${item.amount} \$'),
                              Text('Tarih: ${item.date}'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        CircleAvatar(
                          backgroundImage: AssetImage(item.imagePath),
                          radius: 24,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
