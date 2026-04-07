enum PlaceCategory { historicalSite, museum, hotel, tour }

class PlaceModel {
  final String imagePath;
  final String title;
  final String location;
  final String description;
  final String egyptianPrice;
  final String foreignPrice;
  final PlaceCategory category;

  const PlaceModel({
    required this.imagePath,
    required this.title,
    required this.location,
    required this.description,
    required this.egyptianPrice,
    required this.foreignPrice,
    required this.category,
  });
}
