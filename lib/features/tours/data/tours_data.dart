import 'package:flutter_application_2/core/models/place_model.dart';

class ToursData {
  static const List<PlaceModel> tours = [
    PlaceModel(
      imagePath: "images/c1.jpg",
      title: "Cairo Tour",
      location: "Cairo",
      description:
          "Starts at 8:00 am with pickup from your hotel in Cairo or Giza by Emo tour guide. "
          "Visit The Egyptian Museum — the oldest archaeological museum in the Middle East, housing the largest collection of Pharaonic antiquities in the world. "
          "The museum was inaugurated in 1902 by Khedive Abbas Helmy II and is home to the complete burials of Yuya and Thuya, the treasures of Tanis, and the Narmer Palette. "
          "Then continue to the Cairo Tower (Borg El-Qāhira), a 187m free-standing concrete tower offering panoramic views over Cairo.",
      egyptianPrice: "300 EGP",
      foreignPrice: "135 \$",
      category: PlaceCategory.tour,
    ),
    PlaceModel(
      imagePath: "images/c2.jpg",
      title: "Alexandria Tour",
      location: "Alexandria",
      description:
          "Starts at 07:00 am with pickup from your hotel in Cairo or Giza. Transfer by private A/C vehicle to Alexandria (220 km away), arriving around 10 am. "
          "Visit the Roman Theater at Kom El-Dikka — the largest above-ground archaeological site in Alexandria. "
          "Then explore the Catacombs of Kom El Shoqafa, one of the Seven Wonders of the Middle Ages. "
          "Continue to the Bibliotheca Alexandrina, Qaitbay Citadel built over the ruins of Alexandria's ancient Lighthouse, and El Mursi Abu El Abbas Mosque.",
      egyptianPrice: "200 EGP",
      foreignPrice: "87 \$",
      category: PlaceCategory.tour,
    ),
    PlaceModel(
      imagePath: "images/c3.jpg",
      title: "Aswan Tour",
      location: "Aswan",
      description:
          "Your expert tour guide will pick you up from your hotel in Aswan and drive south (around 3 hours) to enjoy the Abu Simbel day tour. "
          "The two Temples of Abu Simbel are considered masterpieces of ancient Egypt, reflecting the glory and grandeur of the New Kingdom. "
          "The Temple of Ramses II was dedicated to the gods Ptah, Re-Her-Akhtey, and Amun-Re. "
          "The Temple of Queen Nefertari is also called the Temple of Hathor. Spend around 3 hours there then return to Aswan.",
      egyptianPrice: "100 EGP",
      foreignPrice: "35 \$",
      category: PlaceCategory.tour,
    ),
    PlaceModel(
      imagePath: "images/c4.jpg",
      title: "Luxor Tour",
      location: "Luxor",
      description:
          "Starts at 5:00 am with pickup from your hotel in Luxor, driving south towards Aswan (280 km). "
          "Arrive Aswan then drive to Abu Simbel to enjoy the iconic temples. "
          "The two Temples of Abu Simbel are considered masterpieces of ancient Egypt, saved by a UNESCO and Egyptian government cooperation. "
          "The Temple of Ramses II and the Temple of Queen Nefertari together bring Ramesses II, Nefertari, Hathor, and the Sun God together as one.",
      egyptianPrice: "500 EGP",
      foreignPrice: "200 \$",
      category: PlaceCategory.tour,
    ),
  ];
}
