import 'package:flutter/material.dart';
import 'package:flutter_application_2/login.dart';
import 'signup.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double imageHeight = (size.height * 0.45).clamp(220.0, 500.0);
    final double topTextFontSize = (size.width * 0.14).clamp(35.0, 65.0);
    final double verticalSpacingBetweenTextAndImage = (size.height * 0.4).clamp(10.0, 20.0);
    final double bottomSpacerHeight = (size.height * 0.1).clamp(40.0, 180.0);

    double buttonHorizontalPadding(double factor) =>
        (size.width * factor).clamp(20.0, 100.0);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 33, 33),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:verticalSpacingBetweenTextAndImage),
              Text(
                "Welcome!",
                
                style: TextStyle(
                  height: 1,
                  letterSpacing: 4,
                  fontSize: topTextFontSize,
                  color: const Color.fromARGB(255, 254, 141, 0),
                  fontFamily: "norse-bold",
                ),
              ),

              SizedBox(height: verticalSpacingBetweenTextAndImage),

              SizedBox(
                height: imageHeight,
                child: Image.asset(
                  "images/pharoes.png",
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: verticalSpacingBetweenTextAndImage),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 33, 33, 33),
                      foregroundColor: const Color.fromARGB(255, 254, 141, 0),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: buttonHorizontalPadding(0.25),
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 254, 141, 0)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: "norse-bold",
                        fontSize: 28,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text('Login'),
                  ),

                  SizedBox(height: 25),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 254, 141, 0),
                      foregroundColor: const Color.fromARGB(255, 33, 33, 33),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: buttonHorizontalPadding(0.25),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: "norse-bold",
                        fontSize: 28,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: const Text('Signup'),
                  ),
                ],
              ),

              SizedBox(height: bottomSpacerHeight),
            ],
          ),
        ),
      ),
    );
  }
}
