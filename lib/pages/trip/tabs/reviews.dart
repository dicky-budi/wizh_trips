import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class Reviews extends StatelessWidget {
  Reviews({super.key});
  final TripSelectedController tripSelectedController =
      Get.find<TripSelectedController>();

  Widget userReview() {
    return Column(
      children: [
        for (var i = 0; i < tripSelectedController.trip.reviews.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tripSelectedController.trip.reviews[i].reviewer,
                    style: TextStyle(
                      color: WizhColor.eerieBlack,
                      fontSize: size16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${tripSelectedController.trip.reviews[i].rating} ",
                        style: TextStyle(
                          color: WizhColor.eerieBlack,
                          fontSize: size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "/ 5",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: size16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: size2),
              Text(
                DateFormat('dd MMM yyyy').format(
                  DateTime.parse(tripSelectedController.trip.reviews[i].date),
                ),
                style: TextStyle(color: Colors.grey[600], fontSize: size12),
              ),
              const SizedBox(height: size12),
              Text(
                tripSelectedController.trip.reviews[i].comment,
                style: TextStyle(
                  color: WizhColor.eerieBlack,
                  fontSize: size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: size12),
              if (i < tripSelectedController.trip.reviews.length - 1)
                Column(
                  children: [
                    Divider(height: size4, thickness: 1.5),
                    const SizedBox(height: size12),
                  ],
                ),
            ],
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "${tripSelectedController.trip.starRating} ",
                style: TextStyle(
                  color: WizhColor.eerieBlack,
                  fontSize: size32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "/ 5",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: size12),
              Text(
                "From ${NumberFormat.decimalPattern('id_ID').format(tripSelectedController.trip.numberOfReviews)} reviews",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: size12),
          userReview(),
        ],
      ),
    );
  }
}
