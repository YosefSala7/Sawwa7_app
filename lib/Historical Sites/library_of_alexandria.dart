import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';

class librarry extends StatelessWidget {
  librarry({super.key});

  final page b5 = page(
    path: "images/R.jpg",
    t1: "Library Of Alexandria",
    t2: "GBab Shar, Alexandria",
    description: 
        "The Library of Alexandria was one of the most famous libraries of the ancient world. It was founded in the 3rd century BC and served as a center for learning and scholarship in Alexandria, Egypt. The library was known for its vast collection of scrolls and manuscripts, which were gathered from all over the ancient world"
        "The library was not just a place for storing books, but also a center for research and intellectual exchange. Scholars and philosophers from different parts of the world would come to Alexandria to study and contribute to the library's collection."
        "Unfortunately, the Library of Alexandria was destroyed multiple times throughout history, and its exact location and contents remain a subject of debate and speculation. It is believed that the library was burned down during the Roman conquest of Egypt in 30 BC, but there are also accounts of later destructions."
        "Today, the Bibliotheca Alexandrina stands as a modern tribute to the ancient Library of Alexandria. It is a major cultural and educational center that houses millions of books and serves as a hub for research, exhibitions, and cultural events.",
        egyptianPrice: "50 Eg",
        foreignPrice: "15 \$",
        );

  
  @override
  Widget build(BuildContext context) {
    return b5;

    
  }
}
