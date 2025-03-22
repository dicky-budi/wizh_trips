import 'dart:convert';

import 'package:get/get.dart';
import 'package:wizh_trips/entity/trip_entity.dart';
import 'package:flutter/services.dart' show rootBundle;

class TripController extends GetxController with StateMixin<List<TripData>> {
  List<TripData> tripData = [];

  @override
  void onInit() {
    super.onInit();
    fetchPopularTrip();
  }

  Future<List<TripData>> fetchPopularTrip() async {
    change(tripData, status: RxStatus.loading());

    final String jsonString = await rootBundle.loadString(
      'lib/resources/hotel_place.json',
    );
    final hotelResponse = jsonDecode(jsonString);
    tripData =
        (hotelResponse["data"] as List<dynamic>)
            .map((e) => TripData.fromJson(e))
            .toList();

    change(tripData, status: RxStatus.success());

    return tripData;
  }
}

class TripCategoryController extends GetxController {
  RxString category = "All".obs;

  updateCategory(String selectedCategory) => category.value = selectedCategory;
}
