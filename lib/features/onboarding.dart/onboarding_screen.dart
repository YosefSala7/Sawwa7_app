import 'package:flutter/material.dart';
import 'package:flutter_application_2/NavBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_cubit.dart';
import 'onboarding_model.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, int>(
        builder: (context, index) {
          final data = onboardingData[index];

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 33, 33, 33),
            body: SafeArea(
              child: Column(
                children: [
                  // Skip
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Navbar(),
                          ),
                        );
                      },
                      child: const Text("Skip"),
                    ),
                  ),

                  // Image
                  Expanded(
                    child: Image.asset(data.path),
                  ),

                  // Text
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.title,
                            style: const TextStyle(color: Colors.orange)),
                        const SizedBox(height: 10),
                        Text(data.subtitle,
                            style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),

                  // Button
                  ElevatedButton(
                    onPressed: () {
                      if (index == onboardingData.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Navbar(),
                          ),
                        );
                      } else {
                        context.read<OnboardingCubit>().next();
                      }
                    },
                    child: Text(data.buttonText),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}