import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/entity/trip_entity.dart';
import 'package:wizh_trips/pages/trip/image_view.dart';
import 'package:wizh_trips/pages/trip/modals/accomodation_rules.dart'
    show showAccommodationModal;
import 'package:wizh_trips/pages/trip/trip_location.dart';
import 'package:wizh_trips/shared/choice_chip.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class TripDetailPage extends StatefulWidget {
  const TripDetailPage({super.key});

  @override
  State<TripDetailPage> createState() => TripDetailPageState();
}

class TripDetailPageState extends State<TripDetailPage>
    with SingleTickerProviderStateMixin {
  final TripSelectedController tripSelectedController =
      Get.find<TripSelectedController>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: tripSelectedController.tabIndex.value,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget backBtn() {
    return SafeArea(
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            color: WizhColor.whiteSmoke,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: size8,
              vertical: size8,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: size16,
                color: WizhColor.eerieBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rating() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, size: size12, color: Color(0xFFA98660)),
        const SizedBox(width: size4),
        Text(
          "${tripSelectedController.trip.starRating} (${NumberFormat.decimalPattern('id_ID').format(tripSelectedController.trip.numberOfReviews)} Reviews)",
          style: TextStyle(
            color: Color(0xFF574938),
            fontSize: size12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget tabBar() {
    return TabBar(
      tabs: [Tab(text: "Overview"), Tab(text: "Reviews"), Tab(text: "About")],
      controller: tabController,
      labelColor: WizhColor.eerieBlack,
      labelStyle: TextStyle(fontSize: size16, fontWeight: FontWeight.w800),
      unselectedLabelStyle: TextStyle(
        fontSize: size16,
        fontWeight: FontWeight.normal,
      ),
      indicatorColor: WizhColor.beaver,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorAnimation: TabIndicatorAnimation.linear,
      onTap: (index) {
        tripSelectedController.updateTabIndex(index);
      },
    );
  }

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
              for (var image in tripSelectedController.trip.image)
                InkWell(
                  onTap: () {
                    Get.to(() => ImageView());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size8),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      width: 100,
                      height: 100,
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

  Widget overviewTab() {
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

  Widget aboutTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [contact(), const SizedBox(height: size12), maps()],
      ),
    );
  }

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

  Widget reviewTab() {
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

  Widget tabContent() {
    return Obx(
      () => IndexedStack(
        index: tripSelectedController.tabIndex.value,
        children: [
          Visibility(
            visible: tripSelectedController.tabIndex.value == 0,
            maintainState: true,
            child: overviewTab(),
          ),
          Visibility(
            visible: tripSelectedController.tabIndex.value == 1,
            maintainState: true,
            child: reviewTab(),
          ),
          Visibility(
            visible: tripSelectedController.tabIndex.value == 2,
            maintainState: true,
            child: aboutTab(),
          ),
        ],
      ),
    );
  }

  Widget availableRooms(Rooms room) {
    return Column(
      children: [
        Material(
          elevation: size8,
          borderRadius: BorderRadius.circular(size12),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size12),
              color: WizhColor.pearlBush,
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size12),
                        topRight: Radius.circular(size12),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                          "http://pix5.agoda.net/hotelimages/1/-1/d821f80943f96ebda33f5a019fa94df4.jpg?s=312x",
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: size12,
                      vertical: size12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                room.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: size16,
                                  fontWeight: FontWeight.bold,
                                  color: WizhColor.eerieBlack,
                                ),
                              ),
                              const SizedBox(height: size4),
                              Text(
                                "100% Refund & Reschedule until ${DateFormat('dd MMM yyyy').format(DateTime.parse(room.rescheduleDate))}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: size12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                              const SizedBox(height: size8),
                              Divider(height: size4, thickness: 1),
                              const SizedBox(height: size8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.width_wide,
                                            size: size16,
                                            color: WizhColor.eerieBlack,
                                          ),
                                          const SizedBox(width: size8),
                                          Text(
                                            room.area,
                                            style: TextStyle(
                                              fontSize: size12,
                                              color: WizhColor.eerieBlack
                                                  .withOpacity(.3),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: size4),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            size: size16,
                                            color: WizhColor.eerieBlack,
                                          ),
                                          const SizedBox(width: size8),
                                          Text(
                                            "${room.pax} Guest(s)",
                                            style: TextStyle(
                                              fontSize: size12,
                                              color: WizhColor.eerieBlack
                                                  .withOpacity(.3),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: size4),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.bed,
                                            size: size16,
                                            color: WizhColor.eerieBlack,
                                          ),
                                          const SizedBox(width: size8),
                                          Text(
                                            room.bed,
                                            style: TextStyle(
                                              fontSize: size12,
                                              color: WizhColor.eerieBlack
                                                  .withOpacity(.3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "IDR ${NumberFormat.decimalPattern('id_ID').format(int.parse(room.discountedPrice))}",
                                        style: TextStyle(
                                          fontSize: size20,
                                          color: WizhColor.beaver,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "/room/night",
                                        style: TextStyle(
                                          fontSize: size12,
                                          color: WizhColor.taupe,
                                        ),
                                      ),
                                      const SizedBox(height: size4),
                                      RichText(
                                        text: TextSpan(
                                          text: "(after taxes: ",
                                          style: TextStyle(
                                            fontSize: size12,
                                            color: WizhColor.taupe,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  "IDR ${NumberFormat.decimalPattern('id_ID').format(int.parse(room.afterTaxPrice))}",
                                              style: TextStyle(
                                                color: WizhColor.eerieBlack
                                                    .withOpacity(.3),
                                                fontSize: size12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ")",
                                              style: TextStyle(
                                                fontSize: size12,
                                                color: WizhColor.taupe,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SwipeButton(
                          thumbPadding: EdgeInsets.all(size4),
                          thumb: Icon(
                            Icons.chevron_right,
                            color: WizhColor.springWood,
                          ),
                          elevationThumb: size4,
                          elevationTrack: size4,
                          activeTrackColor: Color(0xFF443C30),
                          activeThumbColor: Color(0xFF9B8774),
                          child: Text(
                            "Book Now",
                            style: TextStyle(
                              color: WizhColor.springWood,
                              fontSize: size16,
                            ),
                          ),
                          onSwipe: () async {
                            Get.snackbar("Coming Soon", "Please Stay Tuned!");
                          },
                        ),
                        const SizedBox(height: size8),
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

  Widget roomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: size16),
        Text(
          "Available Room",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size16,
            color: WizhColor.eerieBlack,
          ),
        ),
        const SizedBox(height: size12),
        for (final room in tripSelectedController.trip.rooms ?? [])
          Column(
            children: [availableRooms(room), const SizedBox(height: size12)],
          ),
      ],
    );
  }

  Widget accommodationRules() {
    return Padding(
      padding: const EdgeInsets.only(top: size12),
      child: Card(
        elevation: size4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size8),
        ),
        color: WizhColor.springWood,
        child: Padding(
          padding: const EdgeInsets.only(
            left: size8,
            right: size8,
            bottom: size8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: size8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Accommodation Rules",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16,
                      color: WizhColor.eerieBlack,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showAccommodationModal(
                        tripSelectedController: tripSelectedController,
                      );
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size12,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: tripSelectedController.trip.image[0],
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Positioned(top: size12, left: size16, child: backBtn()),
          DraggableScrollableSheet(
            initialChildSize: .7,
            minChildSize: .7,
            maxChildSize: 1,
            snap: true,
            snapSizes: [0.75, 1],
            builder:
                (context, controller) => ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size20),
                    topRight: Radius.circular(size20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(color: WizhColor.springWood),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: size16,
                        vertical: size20,
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        controller: controller,
                        padding: EdgeInsets.zero,
                        children: [
                          Row(
                            children: [
                              for (final tag
                                  in tripSelectedController.trip.tags ?? [])
                                Row(
                                  children: [
                                    WizhChip(
                                      selected: true,
                                      onSelected: (value) {},
                                      text: tag,
                                    ),
                                    const SizedBox(width: size8),
                                  ],
                                ),
                            ],
                          ),
                          const SizedBox(height: size8),
                          Text(
                            tripSelectedController.trip.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size24,
                            ),
                          ),
                          const SizedBox(height: size8),
                          rating(),
                          const SizedBox(height: size12),
                          Card(
                            elevation: size4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(size8),
                            ),
                            color: WizhColor.springWood,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: size8,
                                vertical: size8,
                              ),
                              child: Column(
                                children: [
                                  tabBar(),
                                  const SizedBox(height: size16),
                                  tabContent(),
                                ],
                              ),
                            ),
                          ),
                          tripSelectedController.trip.type == "hotel"
                              ? accommodationRules()
                              : const SizedBox(),
                          tripSelectedController.trip.type == "hotel"
                              ? roomSection()
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
