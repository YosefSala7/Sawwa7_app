import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';


class royal extends StatelessWidget {
  royal({super.key});

  final page b9 = page(
    path: "images/m3.jpg",
    t1: "Royal Jewelry Museum",
    t2: "El Raml 2, Alexandria",
    description:
       "The Royal Jewelry Museum displays the collectibles of the Egyptian royal family, founded by Muhammad Ali Pasha in 1805 and continued to rule for 150 years, until 1952."
"Zaynab Fahmi built the palace in 1919 in Zizinya, Alexandria. It served as the residence of Fatma al- Zahra’, daughter of Prince Ali Haider, a descendent of Muhammad Ali Pasha.  The palace serves as a striking backdrop to the magnificent possessions owned by the family. It uniquely merges between European and Islamic styles, reflecting the fine taste of the royal family whose paintings, gilded ceilings, and mosaics decorate the palace rooms. The palace consists of two wings, eastern and western, connected by a corridor. Each wing has a basement and two floors."
"The possessions amassed by the family over the period of their rule are on display in the various halls. A diamond and emerald inlaid collar belonging to the founder of the dynasty, Muhammad Ali Pasha, is among the museum’s collection. The lavish lifestyle of the family is reflected in a gold chessboard, golden binoculars encrusted with diamonds, rubies, emeralds, and gold cups inlaid with precious stones. Also on display are elaborate jewelry sets commissioned by the greatest designers in Europe, which once adorned the queens and princesses of Egypt’s royal family.",
        
    egyptianPrice: "220 EGP",
    foreignPrice: "50 \$",
        );

  
  @override
  Widget build(BuildContext context) {
    return b9;

    
  }
}
