import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/pages/trip/categorized_trip.dart';
import 'package:wizh_trips/pages/trip/popular_trip.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';
import 'package:wizh_trips/shared/trip_card.dart';

class TripListPage extends StatefulWidget {
  const TripListPage({super.key});

  @override
  State<TripListPage> createState() => TripListPageState();
}

class TripListPageState extends State<TripListPage> {
  final TripCategorizedController tripCategorizedController = Get.find();
  final TripSelectedController tripSelectedController = Get.find();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.text = tripCategorizedController.search.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: WizhColor.gradientLinearBg),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: size12,
              vertical: size8,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discover Your",
                        style: TextStyle(
                          height: 1,
                          fontSize: size20,
                          color: WizhColor.eerieBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Next ",
                            style: TextStyle(
                              fontSize: size20,
                              color: WizhColor.eerieBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: size4),
                          TypeWriter(
                            controller: TypeWriterController.fromValue(
                              TypeWriterValue(["Stay!", "Food!"]),
                              duration: Duration(milliseconds: 400),
                              repeat: true,
                              autorun: true,
                            ),
                            builder:
                                (context, value) => Text(
                                  value.text,
                                  style: TextStyle(
                                    fontSize: size24,
                                    letterSpacing: 2,
                                    color: WizhColor.eerieBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: size4),
                  TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: searchController,
                    cursorColor: WizhColor.eerieBlack,
                    onFieldSubmitted: (value) {
                      tripCategorizedController.filterBySearch(value);
                    },
                    onChanged: (value) {
                      tripCategorizedController.updateSearch(value);
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: "Search here",
                      hintStyle: TextStyle(fontSize: size16),
                      prefixIcon: Icon(Icons.search, size: size20),
                      prefixIconColor: WizhColor.eerieBlack,
                      prefixIconConstraints: BoxConstraints(
                        maxWidth: size32,
                        minWidth: size32,
                        maxHeight: size40,
                        minHeight: size40,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: WizhColor.eerieBlack),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: WizhColor.eerieBlack),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: WizhColor.eerieBlack),
                      ),
                    ),
                  ),
                  const SizedBox(height: size4),
                  tripCategorizedController.obx(
                    (trip) =>
                        (tripCategorizedController.search.value.isEmpty)
                            ? Column(
                              children: [PopularTrip(), CategorizedTrip()],
                            )
                            : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: size12,
                              ),
                              child: Column(
                                children: [
                                  for (final trip
                                      in tripCategorizedController
                                          .categorizedTrip)
                                    TripCard(
                                      tripData: trip,
                                      onTap: () {
                                        tripSelectedController.updateTrip(trip);
                                        Get.rootDelegate.toNamed('/detail');
                                      },
                                    ),
                                ],
                              ),
                            ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
