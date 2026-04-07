import 'package:flutter_application_2/core/models/place_model.dart';

class MuseumsData {
  static const List<PlaceModel> museums = [
    PlaceModel(
      imagePath: "images/m1.jpg",
      title: "Graeco Roman Museum",
      location: "Al Attarin, Alexandria",
      description:
          "The Graeco-Roman Museum of Alexandria is one of Egypt's most important cultural landmarks, and the first building in the country specially designed for the preservation and display of antiquities. "
          "It remains unique as the only museum fully dedicated to the civilization of Egypt during the Greek and Roman periods. "
          "Officially established in 1892 and inaugurated by Khedive Abbas Helmy II, it has since undergone several expansions introducing modern display methods.",
      egyptianPrice: "40 EGP",
      foreignPrice: "10 \$",
      category: PlaceCategory.museum,
    ),
    PlaceModel(
      imagePath: "images/m2.jpg",
      title: "Alexandria National Museum",
      location: "Bab Shar, Alexandria",
      description:
          "Originally constructed as a palace for Asaad Basili Pasha in the Italianate architectural style, the building was acquired by the Supreme Council of Antiquities in 1996. "
          "It officially opened as a museum in 2003. Among its most remarkable holdings are sunken antiquities from Abu Qir Bay, coins from various historical periods, and Islamic-era weaponry.",
      egyptianPrice: "20 EGP",
      foreignPrice: "5 \$",
      category: PlaceCategory.museum,
    ),
    PlaceModel(
      imagePath: "images/m3.jpg",
      title: "Royal Jewelry Museum",
      location: "El Raml 2, Alexandria",
      description:
          "The Royal Jewelry Museum displays the collectibles of the Egyptian royal family, founded by Muhammad Ali Pasha in 1805 and ruling for 150 years until 1952. "
          "Built in 1919 in Zizinya, the palace uniquely merges European and Islamic styles. "
          "Among the collection is a diamond and emerald inlaid collar belonging to Muhammad Ali Pasha, a gold chessboard, and golden binoculars encrusted with precious stones.",
      egyptianPrice: "220 EGP",
      foreignPrice: "50 \$",
      category: PlaceCategory.museum,
    ),
    PlaceModel(
      imagePath: "images/m4.jpg",
      title: "Coptic Museum",
      location: "Old Cairo, Cairo",
      description:
          "The Coptic Museum houses the largest collection of Coptic artifacts in the world, inaugurated in 1910. "
          "Established by Marcus Simaika Pasha, the collection represents Coptic history from its earliest beginnings through its rise as a leading center of Christianity. "
          "Magnificently decorated manuscripts, icons, delicately carved woodwork, and elaborate frescos are among its extensive collection.",
      egyptianPrice: "200 EGP",
      foreignPrice: "50 \$",
      category: PlaceCategory.museum,
    ),
    PlaceModel(
      imagePath: "images/m5.jpg",
      title: "Grand Egyptian Museum",
      location: "Al Haram, Giza",
      description:
          "The Grand Egyptian Museum is the largest archaeological museum in the world, located near the Giza pyramids. "
          "It houses an unparalleled collection of ancient Egyptian artifacts, including the complete treasures of Tutankhamun. "
          "The museum represents a landmark achievement in Egypt's cultural heritage preservation and tourism development.",
      egyptianPrice: "20 EGP",
      foreignPrice: "5 \$",
      category: PlaceCategory.museum,
    ),
    PlaceModel(
      imagePath: "images/m6.jpg",
      title: "Museum of Islamic Art",
      location: "Al-Darb Al-Ahmar, Cairo",
      description:
          "The Museum of Islamic Art (MIA) displays, preserves, and interprets Islamic artifacts for national and international visitors. "
          "MIA aims to develop education programs, encourage scientific research, and foster a greater understanding of the contributions made by Islamic civilization to world heritage in the arts and sciences.",
      egyptianPrice: "20 EGP",
      foreignPrice: "20 \$",
      category: PlaceCategory.museum,
    ),
  ];
}
