import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/entity/trip_entity.dart';
import 'package:wizh_trips/shared/choice_chip.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/constants.dart';
import 'package:wizh_trips/shared/spacing.dart';

class CategorizedTrip extends StatefulWidget {
  const CategorizedTrip({super.key});

  @override
  State<CategorizedTrip> createState() => CategorizedTripState();
}

class CategorizedTripState extends State<CategorizedTrip> {
  final TripCategoryController tripCategoryController = Get.find();
  final TripCategorizedController tripCategorizedController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  Widget tripsCard(TripData tripData) {
    return Column(
      children: [
        Material(
          elevation: size4,
          borderRadius: BorderRadius.circular(size12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size12),
              color: Colors.white,
            ),
            height: size120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size12),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(tripData.image[0]),
                      ),
                    ),
                    child: SizedBox(height: size120),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: size12,
                      vertical: size8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tripData.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: size16,
                                  height: 1.2,
                                  fontWeight: FontWeight.bold,
                                  color: WizhColor.eerieBlack,
                                ),
                              ),
                              const SizedBox(height: size4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: size16,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(width: size4),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          "${tripData.starRating.toString()}  ",
                                      style: TextStyle(
                                        color: WizhColor.eerieBlack,
                                        fontSize: size12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "(${tripData.numberOfReviews.toString()})",
                                          style: TextStyle(
                                            color: WizhColor.eerieBlack
                                                .withOpacity(.4),
                                            fontSize: size12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: size4,
                            children: [
                              for (final tag in tripData.tags ?? [])
                                WizhChip(
                                  selected: true,
                                  onSelected: (value) {},
                                  text: tag,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: size20),
      ],
    );
  }

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
                  tripsCard(tripData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
