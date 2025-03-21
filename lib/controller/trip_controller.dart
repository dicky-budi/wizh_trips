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
}

class TripCategoryController extends GetxController {
  RxString category = "All".obs;

  updateCategory(String selectedCategory) => category.value = selectedCategory;
}
