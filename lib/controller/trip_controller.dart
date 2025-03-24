import 'dart:convert';

import 'package:get/get.dart';
import 'package:wizh_trips/entity/trip_entity.dart';
import 'package:flutter/services.dart' show rootBundle;

class TripPopularController extends GetxController
    with StateMixin<List<TripData>> {
  List<TripData> popularTrip = [];

  @override
  void onInit() async {
    super.onInit();
    fetchPopularTrip();
  }

  Future<List<TripData>> fetchPopularTrip() async {
    change(popularTrip, status: RxStatus.loading());

    final String jsonString = await rootBundle.loadString(
      'lib/resources/places.json',
    );
    final tripResponse = jsonDecode(jsonString);
    popularTrip =
        (tripResponse["data"] as List<dynamic>)
            .map((e) => TripData.fromJson(e))
            .toList();

    change(popularTrip, status: RxStatus.success());

    return popularTrip;
  }
}

class TripCategorizedController extends GetxController
    with StateMixin<List<TripData>> {
  List<TripData> categorizedTrip = [];
  List<TripData> categorizedTripHelper = [];
  RxString search = "".obs;

  @override
  void onInit() async {
    super.onInit();
    fetchAllTrip();
  }

  Future<List<TripData>> fetchAllTrip() async {
    change(categorizedTrip, status: RxStatus.loading());

    final String jsonString = await rootBundle.loadString(
      'lib/resources/places.json',
    );
    final tripResponse = jsonDecode(jsonString);
    categorizedTrip =
        (tripResponse["data"] as List<dynamic>)
            .map((e) => TripData.fromJson(e))
            .toList();
    categorizedTripHelper =
        (tripResponse["data"] as List<dynamic>)
            .map((e) => TripData.fromJson(e))
            .toList();

    change(categorizedTrip, status: RxStatus.success());

    return categorizedTrip;
  }

  filterBySearch(String search) {
    change(categorizedTrip, status: RxStatus.loading());

    if (search.isEmpty) {
      categorizedTrip = categorizedTripHelper;
    } else {
      categorizedTrip =
          categorizedTripHelper
              .where(
                (trip) =>
                    trip.name.toLowerCase().contains(search.toLowerCase()),
              )
              .toList();
    }

    change(categorizedTrip, status: RxStatus.success());
  }

  filterCategory(String filterBy) {
    change(categorizedTrip, status: RxStatus.loading());

    if (filterBy == "All") {
      categorizedTrip = categorizedTripHelper;
    } else {
      categorizedTrip =
          categorizedTripHelper
              .where((trip) => trip.type == filterBy.toLowerCase())
              .toList();
    }
    change(categorizedTrip, status: RxStatus.success());
  }

  updateSearch(String search) => this.search.value = search;
}

class TripCategoryController extends GetxController {
  RxString category = "All".obs;

  updateCategory(String selectedCategory) => category.value = selectedCategory;
}

class TripSelectedController extends GetxController {
  TripData trip = TripData(
    city: "",
    description: "",
    image: [""],
    location: [0],
    name: "",
    phone: "",
    starRating: 0,
    type: "",
    reviews: [],
  );
  RxInt tabIndex = 0.obs;

  updateTrip(TripData selectedTrip) => trip = selectedTrip;
  updateTabIndex(int index) => tabIndex.value = index;
}

// class TripSearchController extends GetxController
//     with StateMixin<List<TripData>> {
//   List<TripData> categorizedTrip = [];
//   List<TripData> categorizedTripHelper = [];

//   @override
//   void onInit() async {
//     super.onInit();
//     fetchAllTrip();
//   }

//   Future<List<TripData>> fetchAllTrip() async {
//     change(categorizedTrip, status: RxStatus.loading());

//     final String jsonString = await rootBundle.loadString(
//       'lib/resources/places.json',
//     );
//     final tripResponse = jsonDecode(jsonString);
//     categorizedTrip =
//         (tripResponse["data"] as List<dynamic>)
//             .map((e) => TripData.fromJson(e))
//             .toList();
//     categorizedTripHelper =
//         (tripResponse["data"] as List<dynamic>)
//             .map((e) => TripData.fromJson(e))
//             .toList();

//     change(categorizedTrip, status: RxStatus.success());

//     return categorizedTrip;
//   }

//   filterCategory(String filterBy) {
//     change(categorizedTrip, status: RxStatus.loading());

//     if (filterBy == "All") {
//       categorizedTrip = categorizedTripHelper;
//     } else {
//       categorizedTrip =
//           categorizedTripHelper
//               .where((trip) => trip.type == filterBy.toLowerCase())
//               .toList();
//     }
//     change(categorizedTrip, status: RxStatus.success());
//   }
// }
