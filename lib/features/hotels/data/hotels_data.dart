import 'package:flutter_application_2/core/models/place_model.dart';

class HotelsData {
  static const List<PlaceModel> hotels = [
    PlaceModel(
      imagePath: "images/h1.jpg",
      title: "Cairo Pyramids Hotel",
      location: "Al Haram, Giza",
      description:
          "Cairo Pyramids Hotel, where the rich history of Cairo seamlessly merges with contemporary luxury. "
          "With the iconic Pyramids of Giza as a backdrop, our hotel offers an ideal getaway for those seeking an authentic Egyptian experience. "
          "Each meticulously designed room and suite is equipped with modern amenities. Our strategic location allows easy access to Cairo's major attractions.",
      egyptianPrice: "5,524 EGP",
      foreignPrice: "125 \$",
      category: PlaceCategory.hotel,
    ),
    PlaceModel(
      imagePath: "images/h2.jpg",
      title: "Hilton Alexandria GreenPlaza",
      location: "Sidi Gaber, Alexandria",
      description:
          "Situated in the heart of Egypt's second largest city, Hilton Alexandria Green Plaza offers contemporary accommodation and a wealth of business and leisure amenities. "
          "Dine in one of the six restaurants and bars, relax by the outdoor and indoor pool, or make the most of the city's largest ballroom and meeting space. "
          "Located inside one of Egypt's largest shopping malls in Smouha business district.",
      egyptianPrice: "4,579 EGP",
      foreignPrice: "120 \$",
      category: PlaceCategory.hotel,
    ),
    PlaceModel(
      imagePath: "images/h3.jpg",
      title: "Hilton Luxor Resort & Spa",
      location: "Karnak, Luxor",
      description:
          "Hilton Luxor Resort & Spa is the ideal base from which to explore the rich and ancient culture of the Nile Valley. "
          "Situated on the east bank with the largest waterfront on the Nile, the Temple of Karnak and Valley of Kings are on our doorstep. "
          "Our World Class Spa covers 1,150 m² with 12 individual treatment rooms and a Spa Infinity Pool.",
      egyptianPrice: "14,066 EGP",
      foreignPrice: "185 \$",
      category: PlaceCategory.hotel,
    ),
    PlaceModel(
      imagePath: "images/h4.jpg",
      title: "Mövenpick Aswan",
      location: "Sheyakhah Oula, Aswan",
      description:
          "The Movenpick Resort Aswan is located within walking distance of Elephantine Island overlooking the Nile River. "
          "The panoramic on-site bar and restaurant offers beautiful 360-degree views of the river and surrounding areas. "
          "Guests can choose from 404 rooms, suites, and villas. Complimentary WiFi is provided in all areas of the building.",
      egyptianPrice: "14,936 EGP",
      foreignPrice: "135 \$",
      category: PlaceCategory.hotel,
    ),
    PlaceModel(
      imagePath: "images/h5.jpg",
      title: "Barceló Tiran Sharm",
      location: "Sharm El Sheikh",
      description:
          "Barcelo Tiran Sharm Resort — where exquisite elegance meets unparalleled hospitality. "
          "Nestled on the shores of the Red Sea, our resort offers a sanctuary of tranquility for discerning travelers. "
          "Immerse yourself in the beauty of our pristine beach, indulge in world-class amenities, and rejuvenate at our luxurious spa.",
      egyptianPrice: "9,148 EGP",
      foreignPrice: "175 \$",
      category: PlaceCategory.hotel,
    ),
    PlaceModel(
      imagePath: "images/h6.jpg",
      title: "Hilton Hurghada Plaza",
      location: "Gabal El Hareem Street, Hurghada",
      description:
          "Experience the beauty of the Red Sea at Hilton Hurghada Plaza, with scuba diving and water-sport activities on the private beach. "
          "Work out at the 24-hour gym, enjoy tennis, or relax at the swim-up pool bar. "
          "Only fifteen minutes from Hurghada International Airport, next to the Hurghada City Centre Mall.",
      egyptianPrice: "5,696 EGP",
      foreignPrice: "170 \$",
      category: PlaceCategory.hotel,
    ),
  ];
}
