import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/get_started/get_started_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/get_started/get_started_event.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/get_started/get_started_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/get_started_controller.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetStartedBloc(GetStartedController()),
      child: BlocListener<GetStartedBloc, GetStartedState>(
        listener: (context, state) {
          if (state is GetStartedNavigating) {
            // Örneğin login sayfasına yönlendir
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xfff8f6f6),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Image.asset(
                    'assets/images/get_started_top.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: Color(0xfff8f6f6),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/cube_icon.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'cubeconnect',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Aramıza katıldığınız için teşekkür ederiz.\nGüzel işler sizi bekliyor.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            context.read<GetStartedBloc>().add(
                              GetStartedButtonPressed(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffd6e4ec),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Hadi Başlayalım"),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text.rich(
                          TextSpan(
                            text: 'Devam ettiğiniz takdirde ',
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                text: 'gizlilik koşullarını ',
                                style: TextStyle(color: Colors.pink),
                              ),
                              TextSpan(text: 'onaylamış olursunuz.'),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
