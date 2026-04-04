import 'package:flutter/material.dart';
import 'package:flutter_application_2/mariam.dart';

class sharm extends StatelessWidget {
  sharm({super.key});

  final page b5 = page(
    path: "images/h5.jpg",
    t1: "Barceló Tiran Sharm",
    t2: " Sharm El Sheikh",
    description:
        "Arrival to Sharm El-Shaikh airport, our representative will meet you at the airport  then take you to hotel."
        "Barcelo Tiran Sharm Resort, where exquisite elegance meets unparalleled hospitality. Nestled on the shores of the Red Sea, our resort is a hidden gem offering a sanctuary of tranquility for discerning travelers. Immerse yourself in the beauty of our pristine beach, indulge in delectable culinary experiences, and indulge in world-class amenities. Unwind in our beautifully appointed rooms, rejuvenate at our luxurious spa, or make a splash in our sparkling pools. Whether you seek adventure or relaxation, Barcelo Tiran Sharm Resort promises an unforgettable experience that transcends your expectations.",
    egyptianPrice: "9,148 Eg",

    foreignPrice: "175 \$",
  );

  @override
  Widget build(BuildContext context) {
    return b5;
  }
}
