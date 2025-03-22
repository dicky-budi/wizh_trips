import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImageProvider;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class PopularTrip extends StatefulWidget {
  const PopularTrip({super.key});

  @override
  State<PopularTrip> createState() => PopularTripState();
}

class PopularTripState extends State<PopularTrip> {
  final CarouselController controller = CarouselController(initialItem: 1);
  final TripPopularController c = Get.find<TripPopularController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget rating(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size16),
        color: Colors.white10,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size8, vertical: size4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, size: size12, color: Colors.yellow),
            const SizedBox(width: size4),
            c.obx(
              (trip) => Text(
                trip?[index].starRating.toString() ?? "",
                style: TextStyle(
                  color: WizhColor.isabelline,
                  fontSize: size12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget location(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size16),
        color: Colors.white10,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size8, vertical: size4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on_outlined, size: size16, color: Colors.white),
            const SizedBox(width: size4),
            c.obx(
              (trip) => Text(
                "${trip?[index].country}, ${trip?[index].city}",
                style: TextStyle(
                  color: WizhColor.isabelline,
                  fontSize: size12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carouselImage() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      child: c.obx(
        (trip) => CarouselView(
          controller: controller,
          shrinkExtent: 250,
          itemSnapping: true,
          itemExtent: MediaQuery.of(context).size.width * 0.8,
          elevation: 2,
          scrollDirection: Axis.horizontal,
          children: List<Widget>.generate(5, (int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size24),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black38,
                    BlendMode.darken,
                  ),
                  image: CachedNetworkImageProvider(
                    trip?[index].image[0] ?? "",
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: size16,
                  vertical: size12,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        trip?[index].name ?? "",
                        style: TextStyle(
                          color: WizhColor.isabelline,
                          fontSize: size28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: size8),
                        child: location(index),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: size8),
                        child: rating(index),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
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
            "Popular Destination",
            style: TextStyle(fontSize: size16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: size12),
          carouselImage(),
        ],
      ),
    );
  }
}
