import 'package:cubeincubation_mobile_hackathon_2025/views/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs/splash/splash_bloc.dart';
import '../blocs/blocs/splash/splash_event.dart';
import '../blocs/blocs/splash/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _fontSizeAnimation;

  @override
  void initState() {
    super.initState();

    context.read<SplashBloc>().add(SplashStarted());

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _fontSizeAnimation = Tween<double>(begin: 0.0, end: 30.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutExpo, // smoother
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashFinished) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const GetStartedPage()),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/splash.jpeg', fit: BoxFit.cover),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.47,
              left: MediaQuery.of(context).size.width * 0.30,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: AnimatedBuilder(
                  animation: _fontSizeAnimation,
                  builder: (context, child) {
                    return Text(
                      'cubeconnect',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _fontSizeAnimation.value,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
