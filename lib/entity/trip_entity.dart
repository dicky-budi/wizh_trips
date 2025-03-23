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
  final String? openDays;
  final String? openTime;
  final String phone;
  final List<Review> reviews;
  final List<Rooms>? rooms;
  final String? checkinTime;
  final String? checkoutTime;

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
    required this.phone,
    required this.reviews,
    this.address,
    this.zipcode,
    this.ratesFrom,
    this.numberOfReviews,
    this.ratingAverage,
    this.ratesCurrency,
    this.openDays,
    this.openTime,
    this.rooms,
    this.checkinTime,
    this.checkoutTime,
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
    phone: json['phone'] ?? "",
    starRating: json['star_rating'] ?? 0,
    openDays: json['open_days'] ?? "",
    openTime: json['open_time'] ?? "",
    type: json['type'] ?? "hotel",
    address: json['address'],
    zipcode: json['zipcode'],
    ratesFrom: json['rates_from'],
    numberOfReviews: json['number_of_reviews'],
    ratingAverage: json['rating_average'],
    ratesCurrency: json['rates_currency'],
    checkinTime: json['checkin_time'] ?? "",
    checkoutTime: json['checkout_time'] ?? "",
    rooms:
        json['rooms'] != null
            ? (json['rooms'] as List<dynamic>)
                .map((e) => Rooms.fromJson(e))
                .toList()
            : null,
    reviews:
        json['reviews'] != null
            ? (json['reviews'] as List<dynamic>)
                .map((e) => Review.fromJson(e))
                .toList()
            : [],
  );
}

class Review {
  final String reviewer;
  final String date;
  final int rating;
  final String comment;
  final List<String> tags;

  Review({
    required this.reviewer,
    required this.date,
    required this.rating,
    required this.comment,
    required this.tags,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    reviewer: json['reviewer'],
    date: json['date'],
    rating: json['rating'],
    comment: json['comment'],
    tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
  );
}

class Rooms {
  final String name;
  final String rescheduleDate;
  final String area;
  final String pax;
  final String bed;
  final String startPrice;
  final String discountedPrice;
  final String afterTaxPrice;

  Rooms({
    required this.name,
    required this.rescheduleDate,
    required this.area,
    required this.pax,
    required this.bed,
    required this.startPrice,
    required this.discountedPrice,
    required this.afterTaxPrice,
  });

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
    name: json['name'],
    rescheduleDate: json['reschedule_date'],
    area: json['area'],
    pax: json['pax'],
    bed: json['bed'],
    startPrice: json['start_price'],
    discountedPrice: json['discounted_price'],
    afterTaxPrice: json['after_tax_price'],
  );
}
