import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';

class Alex_hotel extends StatelessWidget {
  Alex_hotel({super.key});

  final page b2 = page(
    path: "images/h2.jpg",
    t1: "Hilton Alexandria GreenPlaza",
    t2: "Sidi Gaber, Alexandria",
    description:
        "Arrival to Cairo airport or Borg El Arab airport , our representative will meet you at the airport  then take you to hotel"
        "Situated in the heart of Egypt’s second largest city, Hilton Alexandria Green Plaza offers contemporary accommodation and a wealth of business and leisure amenities. Dine in one of the six restaurants & bars, relax by the outdoor & indoor pool or make the most of our superb conference facilities, including the city’s largest ballroom and meeting space. Located inside one of Egypt’s largest shopping malls in Smouha business district, the hotel makes the ideal base for visiting nearby attractions, such as Qaitbay Fort and Bibliotheca Alexandrina.",
    egyptianPrice: "4,579 Eg",

    foreignPrice: "120 \$",
  );

  @override
  Widget build(BuildContext context) {
    return b2;
  }
}
