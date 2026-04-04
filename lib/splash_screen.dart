import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/AllOnboarding.dart'; // contains b1, b2, b3
import 'package:flutter_application_2/navbar.dart';
import 'package:flutter_application_2/storageAuth.dart'; // token storage
import 'package:flutter_application_2/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget? nextScreen;

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    final hasToken = await TokenStorage.hasToken();

    // If user has a token → go to NavBar
    // If not → start onboarding (b1)
    setState(() {
      nextScreen = hasToken
          ? const NavBar(title: '')
          : b1(); // start onboarding flow
    });
  }

  @override
  Widget build(BuildContext context) {
    if (nextScreen == null) {
      // Show loading while checking token
      return const Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 33, 33),
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    // Once ready, show splash animation and go to the chosen screen
    return AnimatedSplashScreen(
      splash: 'images/FINAL LOGO.png',
      nextScreen: nextScreen!,
      backgroundColor: const Color.fromARGB(255, 33, 33, 33),
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 150,
      duration: 2000,
    );
  }
}
