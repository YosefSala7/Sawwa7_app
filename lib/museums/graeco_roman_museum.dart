import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';


class graeco extends StatelessWidget {
  graeco({super.key});

    final page b7 = page(
    path: "images/m1.jpg",
    t1: "Graeco Roman Museum",
    t2: "Al Attarin, Alexandria",
    description: 
"The Graeco-Roman Museum of Alexandria is one of Egypt’s most important cultural landmarks, and the first building in the country to be specially designed for the preservation and display of antiquities. It remains unique as the only museum fully dedicated to the civilization of Egypt during the Greek and Roman periods."
"The idea of the museum began in 1889 with the Italian scholar Giuseppe Botti, who aimed to protect Alexandria’s antiquities from loss and destruction. Thanks to his efforts, the museum was officially established in 1892 and inaugurated by Khedive Abbas Helmy II. The first location was a modest rented house, but the growing discoveries soon created a need for a larger building."
"In 1894, Nubar Pasha laid the cornerstone of a new neoclassical building designed by the architects Dietrich and Stenon. The construction was completed in just one year, and the museum reopened in 1895. Over the years, the museum was directed by several prominent scholars, both foreign and Egyptian, reflecting its international significance. Since 1953, Egyptian archaeologists have been in charge of the institution."
"The museum has undergone several expansions and renovations, the most recent beginning in 2005 and continuing after 2015. These developments introduced a new upper floor, redesigned interiors, and modern display methods, ensuring that the museum continues to serve as both a scientific center and a cultural gateway for visitors to explore Alexandria’s rich Graeco-Roman heritage.",
        egyptianPrice: "40 Eg",
        foreignPrice: "10 \$",
        );

  
  @override
  Widget build(BuildContext context) {
    return b7;

    
  }
}
