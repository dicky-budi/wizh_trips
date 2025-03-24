import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/shared/choice_chip.dart';
import 'package:wizh_trips/shared/constants.dart';
import 'package:wizh_trips/shared/spacing.dart';
import 'package:wizh_trips/shared/trip_card.dart';

class CategorizedTrip extends StatelessWidget {
  CategorizedTrip({super.key});

  final TripCategoryController tripCategoryController = Get.find();
  final TripCategorizedController tripCategorizedController = Get.find();
  final TripSelectedController tripSelectedController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: TextStyle(fontSize: size16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: size8),
          Wrap(
            runSpacing: size4,
            spacing: size8,
            children: [
              for (final category in categories)
                Obx(
                  () => WizhChip(
                    selected:
                        tripCategoryController.category.value == category.name,
                    onSelected: (value) {
                      tripCategoryController.updateCategory(category.name);
                      tripCategorizedController.filterCategory(category.name);
                    },
                    text: category.name,
                    prefixWidget: SvgPicture.asset(
                      category.icon,
                      width: size20,
                      height: size20,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: size12),
          tripCategorizedController.obx(
            (trip) => Column(
              children: [
                for (final tripData
                    in tripCategorizedController.categorizedTrip)
                  TripCard(
                    tripData: tripData,
                    onTap: () {
                      tripSelectedController.updateTrip(tripData);
                      Get.rootDelegate.toNamed('/detail');
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
