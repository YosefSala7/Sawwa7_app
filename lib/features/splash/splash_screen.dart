import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..checkToken(),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          if (state is SplashLoading || state is SplashInitial) {
            return const Scaffold(
              backgroundColor: Color.fromARGB(255, 33, 33, 33),
              body: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }

          if (state is SplashLoaded) {
            return AnimatedSplashScreen(
              splash: 'images/FINAL LOGO.png',
              nextScreen: state.nextScreen,
              backgroundColor: const Color.fromARGB(255, 33, 33, 33),
              splashTransition: SplashTransition.scaleTransition,
              splashIconSize: 150,
              duration: 2000,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}