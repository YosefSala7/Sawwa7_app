import 'package:flutter/material.dart';
import 'package:flutter_application_2/onboarding.dart';
import 'package:flutter_application_2/welcome_screen.dart';

class b1 extends StatelessWidget {
  Onboarding b_1 = Onboarding(
    path: "images/onboarding2.png",
    t1: "Discover the Wonders of Ancient Egypt",
    t2: "Explore the Pyramids, Temples, and Tombs of the Pharaohs",
    bt: "Next",
    rout: b2(),
  );
  b1({super.key});
  @override
  Widget build(BuildContext context) {
    return b_1;
  }
}
class b2 extends StatelessWidget {
  Onboarding b_2 = Onboarding(
    path: "images/onboarding3.png",
    t1: "Experience the Magic of Modern Egypt",
    t2: "Discover the Vibrant Culture, Cuisine, and Nightlife of Egypt's Cities",
    bt: "Next",
    rout: b3(),
  );
  b2({super.key});
  @override
  Widget build(BuildContext context) {
    return b_2;
  }
}
class b3 extends StatelessWidget {
  Onboarding b_3 = Onboarding(
    path: "images/onboarding1.png",
    t1: "Embark on an Egyptian Adventure",
    t2: "Explore the Rich History, Culture, and Natural Beauty of Egypt",
    bt: "Start The Journey",
    rout: WelcomeScreen(),
  );
  b3({super.key});
  @override
  Widget build(BuildContext context) {
    return b_3;
  }
}
