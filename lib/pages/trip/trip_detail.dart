import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/entity/trip_entity.dart';
import 'package:wizh_trips/pages/trip/modals/accomodation_rules.dart'
    show showAccommodationModal;
import 'package:wizh_trips/pages/trip/tabs/about.dart';
import 'package:wizh_trips/pages/trip/tabs/overview.dart';
import 'package:wizh_trips/pages/trip/tabs/reviews.dart';
import 'package:wizh_trips/shared/choice_chip.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';
import 'package:wizh_trips/shared/swipe_button.dart';

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
      children: [
        Icon(Icons.star, size: size12, color: WizhColor.cafe),
        const SizedBox(width: size4),
        Text(
          "${tripSelectedController.trip.starRating} (${NumberFormat.decimalPattern('id_ID').format(tripSelectedController.trip.numberOfReviews)} Reviews)",
          style: TextStyle(
            color: WizhColor.oliveCamouflage,
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

  Widget tabContent() {
    return Obx(
      () => IndexedStack(
        index: tripSelectedController.tabIndex.value,
        children: [
          Visibility(
            visible: tripSelectedController.tabIndex.value == 0,
            maintainState: true,
            child: Overview(),
          ),
          Visibility(
            visible: tripSelectedController.tabIndex.value == 1,
            maintainState: true,
            child: Reviews(),
          ),
          Visibility(
            visible: tripSelectedController.tabIndex.value == 2,
            maintainState: true,
            child: About(),
          ),
        ],
      ),
    );
  }

  Widget accommodationRules() {
    return Padding(
      padding: const EdgeInsets.only(top: size12),
      child: Card(
        elevation: size4,
        margin: EdgeInsets.symmetric(horizontal: size2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size8),
        ),
        color: WizhColor.springWood,
        child: Padding(
          padding: const EdgeInsets.only(
            left: size12,
            right: size12,
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
                          color: WizhColor.eerieBlack.withValues(alpha: .4),
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
                          color: WizhColor.eerieBlack.withValues(alpha: .4),
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
                  color: WizhColor.eerieBlack.withValues(alpha: .4),
                ),
              ),
            ],
          ),
        ),
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
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(room.image.first),
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
                                                  .withValues(alpha: .4),
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
                                                  .withValues(alpha: .4),
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
                                                  .withValues(alpha: .4),
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
                                                    .withValues(alpha: .4),
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
                        WizhSwipeButton(
                          text: "Book Now",
                          onSwipe: () async {
                            Get.snackbar(
                              "Coming Soon",
                              "Please Stay Tuned!",
                              backgroundColor: WizhColor.beaver,
                              colorText: WizhColor.isabelline,
                            );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: tripSelectedController.trip.image.first,
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
                          // Card(
                          //   elevation: size4,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(size8),
                          //   ),
                          //   color: WizhColor.springWood,
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(
                          //       horizontal: size8,
                          //       vertical: size8,
                          //     ),
                          //     child: Column(
                          //       children: [
                          //         tabBar(),
                          //         const SizedBox(height: size16),
                          //         tabContent(),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          tabBar(),
                          const SizedBox(height: size16),
                          tabContent(),
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
