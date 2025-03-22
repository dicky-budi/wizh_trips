class Trip {
  final int response;
  final List<TripData> data;

  Trip({required this.response, required this.data});
}

class TripData {
  final String city;
  final String? country;
  final String? currency;
  final int? deliveryPrice;
  final String description;
  final List<String> image;
  final List<double> location;
  final String name;
  final List<String>? tags;
  final double starRating;
  final String type;
  final String? address;
  final String? zipcode;
  final int? ratesFrom;
  final int? numberOfReviews;
  final double? ratingAverage;
  final String? ratesCurrency;

  TripData({
    required this.city,
    this.country,
    this.currency,
    this.deliveryPrice,
    required this.description,
    required this.image,
    required this.location,
    required this.name,
    this.tags,
    required this.starRating,
    required this.type,
    this.address,
    this.zipcode,
    this.ratesFrom,
    this.numberOfReviews,
    this.ratingAverage,
    this.ratesCurrency,
  });

  factory TripData.fromJson(Map<String, dynamic> json) => TripData(
    city: json['city'],
    country: json['country'],
    currency: json['currency'],
    deliveryPrice: json['delivery_price'],
    description: json['description'] ?? "",
    image: json["image"] != null ? List<String>.from(json['image']) : [],
    location:
        json["location"] != null ? List<double>.from(json['location']) : [],
    name: json['name'] ?? "",
    tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
    starRating: json['star_rating'] ?? 0,
    type: json['type'] ?? "hotel",
    address: json['address'],
    zipcode: json['zipcode'],
    ratesFrom: json['rates_from'],
    numberOfReviews: json['number_of_reviews'],
    ratingAverage: json['rating_average'],
    ratesCurrency: json['rates_currency'],
  );
}

enum TripType { hotel, restaurant }
