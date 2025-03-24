import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/pages/trip/trip_location.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class About extends StatelessWidget {
  About({super.key});
  final TripSelectedController tripSelectedController =
      Get.find<TripSelectedController>();

  Widget contact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact",
          style: TextStyle(
            color: WizhColor.eerieBlack,
            fontSize: size16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: size12),
        Row(
          children: [
            Expanded(
              flex: 0,
              child: Icon(
                Icons.pin_drop_outlined,
                size: size20,
                color: WizhColor.beaver,
              ),
            ),
            const SizedBox(width: size12),
            Expanded(
              flex: 1,
              child: Text(
                "${tripSelectedController.trip.address ?? ""}, ${tripSelectedController.trip.city}, ${tripSelectedController.trip.country}",
                style: TextStyle(color: WizhColor.eerieBlack, fontSize: size12),
              ),
            ),
          ],
        ),
        const SizedBox(height: size8),
        Row(
          children: [
            Expanded(
              flex: 0,
              child: Icon(Icons.phone, size: size20, color: WizhColor.beaver),
            ),
            const SizedBox(width: size12),
            Expanded(
              flex: 1,
              child: Text(
                tripSelectedController.trip.phone,
                style: TextStyle(color: WizhColor.eerieBlack, fontSize: size12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget maps() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Maps",
          style: TextStyle(
            color: WizhColor.eerieBlack,
            fontSize: size16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: size12),
        SizedBox(
          height: 200,
          child: TripLocation(location: tripSelectedController.trip.location),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [contact(), const SizedBox(height: size12), maps()],
      ),
    );
  }
}
