import 'package:cubeincubation_mobile_hackathon_2025/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controllers/home_controller.dart';
import 'blocs/home/home_bloc.dart';
import 'blocs/home/home_event.dart';

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
        create: (_) => HomeBloc(HomeController())..add(LoadInitiatives()),
        child: const HomePage(),
      ),
    );
  }
}
