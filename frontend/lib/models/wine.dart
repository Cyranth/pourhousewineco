class Wine {
  final String name;
  final String type;
  final String varietal;
  final int year;
  final String imageUrl;
  final String description;
  final String region;
  final String country;
  final double rating;
  final int reviews;
  final String foodPairing;
  final String alcoholContent;
  final String winery;
  final String wineryUrl;
  final String tastingNotes;
  final String servingTemperature;
  final String bottleSize;
  final String awards;

  Wine({
    required this.varietal,
    required this.region,
    required this.country,
    required this.rating,
    required this.reviews,
    required this.foodPairing,
    required this.alcoholContent,
    required this.winery,
    required this.wineryUrl,
    required this.tastingNotes,
    required this.servingTemperature,
    required this.bottleSize,
    required this.awards,
    required this.name,
    required this.type,
    required this.year,
    required this.imageUrl,
    required this.description,
  });
}
