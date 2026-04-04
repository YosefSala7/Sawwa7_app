import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';


class islamicart extends StatelessWidget {
  islamicart({super.key});

  final page b12 = page(
    path: "images/m6.jpg",
    t1: "Museum of Islamic Art",
    t2: "Al-Darb Al-Ahmar, Cairo",
    description:
    "The mission of the Museum of Islamic Art (MIA) is to display, preserve and interpret Islamic artifacts, and to reach a maximum number of national and international visitors. MIA also aims to develop education programs, encourage scientific research and collaborations as well as foster a greater understanding and appreciation of the contributions made by the Islamic civilization to world heritage in the arts and sciences. MIA also hopes to encourage dialogue, thus increasing tolerance and mutual understanding among people.",
    egyptianPrice: "20 EGP",
    foreignPrice: "20 \$",
        );

  
  @override
  Widget build(BuildContext context) {
    return b12;

    
  }
}
