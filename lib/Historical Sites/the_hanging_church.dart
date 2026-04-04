import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';

class Thehangingchurch extends StatelessWidget {
  Thehangingchurch({super.key});

  
  final page b3 = page(
    path: "images/22.jpg",
    t1: "the hanging church",
    t2: "Old Cairo, Cairo",
    description:
        " The Hanging Church, officially known as the Church of the Virgin Mary, is a significant landmark located in Coptic Cairo, Egypt. It gets its name from the fact that its nave is suspended over a passageway, as the church is built atop the southern gatehouse of the Roman-built Babylon Fortress. The church is the most important and oldest church in Egypt, attracting both Coptic Christians and tourists."
        "The Hanging Church's historical significance and architectural beauty make it a popular attraction. It has a wooden roof shaped like Noah's ark and is known for its religious ceremonies and important elections, as it served as the residence of the Coptic Patriarch from the 7th to the 13th century ",
        egyptianPrice: "60 EG",
        foreignPrice: "60 \$"
        );

  
  @override
  Widget build(BuildContext context) {
    return b3;

    
  }
}
