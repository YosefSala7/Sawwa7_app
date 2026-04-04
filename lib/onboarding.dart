import 'package:flutter/material.dart';
import 'package:flutter_application_2/welcome_screen.dart';

class Onboarding extends StatelessWidget {
  final String path;
  final String t1;
  final String t2;
  final String bt;
  final Widget rout;

  const Onboarding({
    super.key,
    required this.path,
    required this.t1,
    required this.t2,
    required this.bt,
    required this.rout
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            // Responsive sizes
            final imageHeight = h * 0.6;
            final horizontalPadding = w * 0.06;
            final titleFontSize = (w * 0.08).clamp(20.0, 40.0);
            final subtitleFontSize = (w * 0.04).clamp(14.0, 22.0);
            final buttonWidth = (w * 0.8).clamp(200.0, 600.0);
            final buttonPaddingVertical = (h * 0.018).clamp(12.0, 24.0);

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(
                              const Color.fromARGB(30, 255, 214, 64),
                            ),
                            foregroundColor: WidgetStateProperty.all(
                              const Color.fromARGB(255, 254, 141, 0),
                            ),
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "norse-bold",
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Center image responsively
                    Center(
                      child: SizedBox(
                        width: w * 0.9,
                        height: imageHeight,
                        child: Image.asset(path, fit: BoxFit.contain),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Title + subtitle aligned to center for nicer look on small screens
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t1,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontFamily: "norse-bold",
                              letterSpacing: 2,
                              height: 1.0,
                              color: const Color.fromARGB(255, 254, 141, 0),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: w * 0.9),
                            child: Text(
                              t2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontFamily: "lekton-regular",
                                letterSpacing: 1.5,
                                color: const Color.fromARGB(255, 204, 204, 204),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: h * 0.04),

                    // Button centered and responsive width
                    Center(
                      child: SizedBox(
                        width: buttonWidth,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(
                              255,
                              33,
                              33,
                              33,
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              254,
                              141,
                              0,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: buttonPaddingVertical,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            textStyle: TextStyle(
                              fontFamily: "norse-bold",
                              fontSize: (w * 0.04).clamp(16.0, 28.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => rout,
                              ),
                            );
                          },
                          child: Text(bt),
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.03),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
