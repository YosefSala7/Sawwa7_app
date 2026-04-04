import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';

class cairo_hotel extends StatelessWidget {
  cairo_hotel({super.key});


    final page b1 = page(
    path: "images/h1.jpg",
    t1: "Cairo Pyramids Hotel",
    t2: "Al Haram, Giza",
    description: 
    "Arrival to Cairo airport, our representative will meet you at the airport  then take you to hotel."
    "Cairo Pyramids Hotel, where the rich history of Cairo seamlessly merges with contemporary luxury. With the iconic Pyramids of Giza as a backdrop, our hotel offers an ideal getaway for those seeking an authentic Egyptian experience. Each meticulously designed room and suite is equipped with modern amenities and offers superb comfort for a restful stay. Delight in an array of culinary options, from traditional Egyptian specialties to international flavors, expertly crafted by our world-class chefs. Our strategic location allows easy access to Cairo's major attractions, ensuring that your exploration of this ancient city is convenient and memorable. Whether here for business or leisure, Cairo Pyramids Hotel promises a remarkable stay infused with warm hospitality and exceptional service."
    ,
        egyptianPrice: "5,524 Eg",

        foreignPrice: "125 \$",

        );
    
  
  @override
  Widget build(BuildContext context) {
    return b1;

    
  }
}
