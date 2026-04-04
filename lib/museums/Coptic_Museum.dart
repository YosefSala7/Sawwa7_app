import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';


class coptic extends StatelessWidget {
  coptic({super.key});

  final page b11 = page(
    path: "images/m4.jpg",
    t1: "The Grand Egyptian Museum",
    t2: " Al Haram, Giza",
    description:
       "The Coptic Museum houses the largest collection of Coptic artifacts in the world and was inaugurated in 1910. The museum was established through the efforts of Marcus Simaika Pasha, a prominent Coptic figure who was vested in the preservation of Coptic heritage. Simaika Pasha bought and collected Coptic antiquities and various architectural elements from older churches that were undergoing renovation, and used them to built the museum and establish its collection."
"The collection represents Coptic history from its earliest beginnings in Egypt through to its rise as a leading center of Christianity in the world. Coptic Christianity traces its origins to a visit by Saint Mark in the city of Alexandria in the 1st Century A.D. The artifacts on display in the museum show the merge of Coptic art with the prevailing cultures including Pharaonic, Greek, Roman, Byzantine and Ottoman, and its evolution in developing its own character and identity."
"Magnificently decorated manuscripts, icons, delicately carved woodwork and elaborate frescos with religious scenes recovered from ancient monasteries and churches are among its extensive collection.",
    egyptianPrice: "200 EGP",
    foreignPrice: "50 \$",
        );

  
  @override
  Widget build(BuildContext context) {
    return b11;

    
  }
}
