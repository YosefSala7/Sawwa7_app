import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';


class alex extends StatelessWidget {
  alex({super.key});

    final page b8 = page(
    path: "images/m2.jpg",
    t1: "Alexandria National Museum",
    t2: "Bab Shar, Alexandria",
    description: 
      "Alexandria"
      "The building that now houses the museum was originally constructed as a palace for Asaad Basili Pasha, one of Alexandria’s wealthiest figures, who designed it in the Italianate architectural style. In 1996, the Supreme Council of Antiquities acquired the property and later converted it into an archaeological museum, officially opening it to the public in 2003."
        "The museum’s collection highlights the historical and cultural heritage of Egyptian arts and crafts, spanning from prehistory to the modern era. Among its most remarkable holdings is a rare assemblage of sunken antiquities recovered from excavations in Abu Qir Bay. In addition, the museum features a currency hall showcasing coins from various historical periods, as well as a distinctive display of Islamic-era weaponry. The galleries further include collections of metals, ceramics, and glass, along with exquisite gold, silver, and jewelry once belonging to the family of Muhammad Ali Pasha.",
        egyptianPrice: "20 Eg",
        foreignPrice: "5 \$",
        );

  
  @override
  Widget build(BuildContext context) {
    return b8;

    
  }
}
