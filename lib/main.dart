import 'package:cubeincubation_mobile_hackathon_2025/blocs/auth/login/login_service.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/auth/register/register_service.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/get_started/get_started_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/splash/splash_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/mentor/mentor_profile_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/controllers/get_started_controller.dart';
import 'package:cubeincubation_mobile_hackathon_2025/controllers/splash_controller.dart';
import 'package:cubeincubation_mobile_hackathon_2025/views/mentor_profie.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



// Views
import 'views/splash_screen.dart';
import 'views/auth/auth_page.dart'; // Giriş ekranı

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase bağlantısı

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
        BlocProvider<SplashBloc>(create: (_) => SplashBloc(SplashController())),
        BlocProvider<GetStartedBloc>(
          create: (_) => GetStartedBloc(GetStartedController()),
        ),
        BlocProvider(
          create: (_) => MentorProfileBloc(),
          child: ProfilePage(), // yukarıda oluşturduğumuz sayfa
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CubeConnect',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
