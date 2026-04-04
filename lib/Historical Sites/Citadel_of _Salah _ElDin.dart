import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';
// import 'package:app/home.dart';

class citadel extends StatelessWidget {
  citadel({super.key});

  // هنا بتحددي البيانات اللي هتتبعت لصفحة BaronPage
  final page b2 = page(
    path: "images/salahel.jpg",
    t1: "Citadel Of Salah El Din.",
    t2: "El Mokattam, Cairo",
    description:
       "The Citadel of Salah El Din in Cairo is an impressive historical site located on a hill in the southern part of Islamic Cairo. It is also known as the Citadel of Saladin, named after the renowned Muslim leader Salah El Din. The citadel was built during the medieval period as a defensive fortification and served as the seat of power in Egypt for many centuries. One of the prominent structures within the Citadel is the Mohamed Ali Mosque, also known as the Alabaster Mosque. It was commissioned by Muhammad Ali Pasha, an Ottoman governor of Egypt, in the early 19th century. The mosque was built between 1830 and 1848 and is a beautiful example of Ottoman architecture in Egypt. It is situated at the highest point of the Citadel and its distinctive feature is its large central dome and two towering minarets. The Mohamed Ali Mosque is not only a religious site but also a significant historical and cultural landmark. Inside the mosque, visitors can admire the elegant marble work, intricate detailing, and impressive stained glass windows. The mosque is dedicated to Muhammad Ali Pasha himself and also houses his tomb, which was transferred to the mosque in 18572. Exploring the Citadel of Salah El Din and the Mohamed Ali Mosque offers visitors a glimpse into Egypt's rich history and architectural heritage. The commanding view of Cairo from the Citadel makes it a popular destination for both tourists and locals alike." ,
       
    egyptianPrice: "60 Eg",
    foreignPrice: "20 \$",
       );

  @override
  Widget build(BuildContext context) {
    return b2;
  }
}
