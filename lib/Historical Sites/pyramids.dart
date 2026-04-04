import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';

class Pyramids extends StatelessWidget {
  Pyramids({super.key});

  final page b1 = page(
    path: "images/99.jpg",
    t1: "Pyramids and sphinx",
    t2: "Giza, Egypt",
    description:
        "Unveil the mysteries of ancient Egypt with a mesmerizing visit to some of the world's most iconic edifices—the GIZA PYRAMIDS AND SPHINX. "
        "The pyramids of Giza are one of the seven wonders of the ancient world, an unmissable testament to the grandeur of the ancient civilization. "
        "Seeing them up close is an unforgettable experience. Just a stone's throw away, you'll encounter the mythical Sphinx, an ancient statue with the body of a lion and the head of a human. "
        "This fascinating monument, shrouded in mystery and legend, is one of the most famous landmarks in Egypt. ",
        egyptianPrice: "60 Eg",
        foreignPrice: "60 \$",
        );

  
  @override
  Widget build(BuildContext context) {
    return b1;

    
  }
}
