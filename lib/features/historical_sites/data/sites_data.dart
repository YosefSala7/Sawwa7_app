import 'package:flutter_application_2/core/models/place_model.dart';

class HistoricalSitesData {
  static const List<PlaceModel> sites = [
    PlaceModel(
      imagePath: "images/99.jpg",
      title: "Pyramids and Sphinx",
      location: "Giza, Egypt",
      description:
          "Unveil the mysteries of ancient Egypt with a mesmerizing visit to some of the world's most iconic edifices—the GIZA PYRAMIDS AND SPHINX. "
          "The pyramids of Giza are one of the seven wonders of the ancient world, an unmissable testament to the grandeur of the ancient civilization. "
          "Seeing them up close is an unforgettable experience. Just a stone's throw away, you'll encounter the mythical Sphinx, an ancient statue with the body of a lion and the head of a human. "
          "This fascinating monument, shrouded in mystery and legend, is one of the most famous landmarks in Egypt.",
      egyptianPrice: "60 EGP",
      foreignPrice: "60 \$",
      category: PlaceCategory.historicalSite,
    ),
    PlaceModel(
      imagePath: "images/salahel.jpg",
      title: "Citadel of Salah El Din",
      location: "El Mokattam, Cairo",
      description:
          "The Citadel of Salah El Din in Cairo is an impressive historical site located on a hill in the southern part of Islamic Cairo. "
          "It is also known as the Citadel of Saladin, named after the renowned Muslim leader Salah El Din. "
          "The citadel was built during the medieval period as a defensive fortification and served as the seat of power in Egypt for many centuries. "
          "One of the prominent structures within the Citadel is the Mohamed Ali Mosque, also known as the Alabaster Mosque, commissioned by Muhammad Ali Pasha in the early 19th century.",
      egyptianPrice: "60 EGP",
      foreignPrice: "20 \$",
      category: PlaceCategory.historicalSite,
    ),
    PlaceModel(
      imagePath: "images/R.jpg",
      title: "Library of Alexandria",
      location: "Bab Shar, Alexandria",
      description:
          "The Library of Alexandria was one of the most famous libraries of the ancient world, founded in the 3rd century BC. "
          "It served as a center for learning and scholarship, known for its vast collection of scrolls and manuscripts gathered from all over the ancient world. "
          "Today, the Bibliotheca Alexandrina stands as a modern tribute — a major cultural and educational center housing millions of books.",
      egyptianPrice: "50 EGP",
      foreignPrice: "15 \$",
      category: PlaceCategory.historicalSite,
    ),
    PlaceModel(
      imagePath: "images/8.jpg",
      title: "Qaitbay Citadel",
      location: "Al Gomrok, Alexandria",
      description:
          "The Qaitbay Citadel is a medieval fortress in Alexandria, overlooking the Mediterranean Sea. "
          "Built on the site of the famous Lighthouse of Alexandria — one of the Seven Wonders of the Ancient World — it was designed to protect Alexandria from invasions. "
          "Today it serves as a popular tourist attraction housing a maritime museum with artifacts related to Alexandria's rich maritime heritage.",
      egyptianPrice: "60 EGP",
      foreignPrice: "20 \$",
      category: PlaceCategory.historicalSite,
    ),
    PlaceModel(
      imagePath: "images/22.jpg",
      title: "The Hanging Church",
      location: "Old Cairo, Cairo",
      description:
          "The Hanging Church, officially known as the Church of the Virgin Mary, is a significant landmark in Coptic Cairo. "
          "Its nave is suspended over a passageway, built atop the southern gatehouse of the Roman-built Babylon Fortress. "
          "It is the most important and oldest church in Egypt, and served as the residence of the Coptic Patriarch from the 7th to the 13th century.",
      egyptianPrice: "60 EGP",
      foreignPrice: "60 \$",
      category: PlaceCategory.historicalSite,
    ),
    PlaceModel(
      imagePath: "images/55.jpg",
      title: "The Roman Theater",
      location: "Al Attarin, Alexandria",
      description:
          "The Roman Theater in Alexandria is a remarkable archaeological site showcasing ancient Roman culture and entertainment. "
          "Built in the shape of a semicircle with seating tiers rising from the stage, it was primarily used for theatrical performances. "
          "Today it stands as one of the largest and most complete above-ground archaeological sites in Alexandria.",
      egyptianPrice: "40 EGP",
      foreignPrice: "20 \$",
      category: PlaceCategory.historicalSite,
    ),
  ];
}
