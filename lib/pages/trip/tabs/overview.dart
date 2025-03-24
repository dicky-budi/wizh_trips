import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/pages/trip/image_view.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class Overview extends StatelessWidget {
  Overview({super.key});
  final TripSelectedController tripSelectedController =
      Get.find<TripSelectedController>();

  Widget openingHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Opening Hours",
          style: TextStyle(
            color: WizhColor.eerieBlack,
            fontSize: size16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: size8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tripSelectedController.trip.openDays ?? "",
              style: TextStyle(color: WizhColor.eerieBlack, fontSize: size12),
            ),
            const SizedBox(width: size8),
            Text(
              tripSelectedController.trip.openTime ?? "",
              style: TextStyle(color: WizhColor.eerieBlack, fontSize: size12),
            ),
          ],
        ),
        const SizedBox(height: size12),
      ],
    );
  }

  Widget photos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Photos",
          style: TextStyle(
            color: WizhColor.eerieBlack,
            fontSize: size16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: size12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            direction: Axis.horizontal,
            spacing: size8,
            children: [
              for (var i = 0; i < tripSelectedController.trip.image.length; i++)
                InkWell(
                  onTap: () {
                    Get.to(() => ImageView(index: i));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size8),
                    child: CachedNetworkImage(
                      imageUrl: tripSelectedController.trip.image[i],
                      width: size100,
                      height: size100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tripSelectedController.trip.description,
            textAlign: TextAlign.justify,
            style: TextStyle(color: WizhColor.eerieBlack, fontSize: size12),
          ),
          const SizedBox(height: size12),
          tripSelectedController.trip.type == "restaurants"
              ? openingHours()
              : SizedBox(),
          photos(),
        ],
      ),
    );
  }
}
