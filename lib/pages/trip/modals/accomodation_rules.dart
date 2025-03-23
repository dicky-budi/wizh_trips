import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

showAccommodationModal({
  required TripSelectedController tripSelectedController,
}) {
  showMaterialModalBottomSheet(
    context: Get.context!,
    backgroundColor: WizhColor.isabelline,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(size16),
        topRight: Radius.circular(size16),
      ),
    ),
    builder:
        (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Container(
            decoration: BoxDecoration(
              color: WizhColor.isabelline,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size12),
                topRight: Radius.circular(size12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: size12,
                vertical: size12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          color: WizhColor.eerieBlack,
                          size: size24,
                        ),
                      ),
                      const SizedBox(width: size8),
                      Text(
                        "Accommodation Rules",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size16,
                          color: WizhColor.eerieBlack,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: size16),
                  Text(
                    "Check-in & Check-out",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16,
                      color: WizhColor.eerieBlack,
                    ),
                  ),
                  const SizedBox(height: size8),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Check-in",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size16,
                              color: WizhColor.eerieBlack.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            tripSelectedController.trip.checkinTime ?? "",
                            style: TextStyle(
                              fontSize: size16,
                              color: WizhColor.eerieBlack,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Check-out",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size16,
                              color: WizhColor.eerieBlack.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            tripSelectedController.trip.checkoutTime ?? "",
                            style: TextStyle(
                              fontSize: size16,
                              color: WizhColor.eerieBlack,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: size8),
                  Text(
                    "Want to check in early? Fill out the Special Request form on the booking page.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.4),
                    ),
                  ),
                  const SizedBox(height: size12),
                  Text(
                    "Children",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16,
                      color: WizhColor.eerieBlack,
                    ),
                  ),
                  const SizedBox(height: size8),
                  Text(
                    "Guests of all ages are welcome to stay.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: size4),
                  Text(
                    "Children ages 5 years old and above will be considered as adults.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: size4),
                  Text(
                    "Please make sure that the children's age is consistent with the information listed on your booking details. Otherwise, you may have to pay additional fees upon check-in.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: size12),
                  Text(
                    "Deposit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16,
                      color: WizhColor.eerieBlack,
                    ),
                  ),
                  const SizedBox(height: size8),
                  Text(
                    "Guests need to pay a deposit at check-in.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: size12),
                  Text(
                    "Age",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16,
                      color: WizhColor.eerieBlack,
                    ),
                  ),
                  const SizedBox(height: size8),
                  Text(
                    "Guests of all ages are welcome to stay.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: size12),
                  Text(
                    "Breakfast",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16,
                      color: WizhColor.eerieBlack,
                    ),
                  ),
                  const SizedBox(height: size8),
                  Text(
                    "Breakfast is available from 06.30 - 10:00 local time.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: size12),
                  Text(
                    "Pets",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16,
                      color: WizhColor.eerieBlack,
                    ),
                  ),
                  const SizedBox(height: size8),
                  Text(
                    "No pets allowed.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: size12),
                  Text(
                    "Smoking",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16,
                      color: WizhColor.eerieBlack,
                    ),
                  ),
                  const SizedBox(height: size8),
                  Text(
                    "No smoking room.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: size12),
                  Text(
                    "Alcohol",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16,
                      color: WizhColor.eerieBlack,
                    ),
                  ),
                  const SizedBox(height: size8),
                  Text(
                    "No alcohol drinks allowed.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size12,
                      color: WizhColor.eerieBlack.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
