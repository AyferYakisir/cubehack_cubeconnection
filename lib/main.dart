import 'package:cubeincubation_mobile_hackathon_2025/views/splash_secreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controllers/splash_controller.dart';
import 'blocs/splash/splash_bloc.dart';

void main() {
  runApp(const CubeConnectApp());
}

class CubeConnectApp extends StatelessWidget {
  const CubeConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => SplashBloc(SplashController()),
        child: const SplashScreen(),
      ),
    );
  }
}
