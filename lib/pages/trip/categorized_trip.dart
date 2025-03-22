import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          Card.filled(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size12),
                    child: CachedNetworkImage(
                      imageUrl:
                          "http://pix3.agoda.net/hotelimages/147/147/147_1112051559004767099.jpg?s=312x",
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: size8,
                      vertical: size8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Van der Valk Hotel Hildesheim",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: size16,
                            height: 1.25,
                            fontWeight: FontWeight.bold,
                            color: WizhColor.eerieBlack,
                          ),
                        ),
                        const SizedBox(height: size4),
                        Row(
                          children: [
                            Text(
                              "4",
                              style: TextStyle(
                                fontSize: size12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: size4),
                            for (int i = 0; i < 4; i++)
                              Icon(
                                Icons.star,
                                size: size16,
                                color: Colors.yellow,
                              ),
                            const SizedBox(width: size4),
                          ],
                        ),
                        const SizedBox(height: size12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on, size: size12),
                            const SizedBox(width: size4),
                            Expanded(
                              child: Text(
                                "Markt 4, GPS: Jakobistraße 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: size12,
                                  fontWeight: FontWeight.bold,
                                  color: WizhColor.eerieBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Expanded(child: child)
              ],
            ),
          ),
          const SizedBox(height: size8),
          Card.filled(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size12),
                    child: CachedNetworkImage(
                      imageUrl:
                          "http://pix3.agoda.net/hotelimages/147/147/147_1112051559004767099.jpg?s=312x",
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: size8,
                      vertical: size8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Van der Valk Hotel Hildesheim",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: size16,
                            height: 1.25,
                            fontWeight: FontWeight.bold,
                            color: WizhColor.eerieBlack,
                          ),
                        ),
                        const SizedBox(height: size4),
                        Row(
                          children: [
                            Text(
                              "4",
                              style: TextStyle(
                                fontSize: size12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: size4),
                            for (int i = 0; i < 4; i++)
                              Icon(
                                Icons.star,
                                size: size16,
                                color: Colors.yellow,
                              ),
                            const SizedBox(width: size4),
                          ],
                        ),
                        const SizedBox(height: size12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on, size: size12),
                            const SizedBox(width: size4),
                            Expanded(
                              child: Text(
                                "Markt 4, GPS: Jakobistraße 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: size12,
                                  fontWeight: FontWeight.bold,
                                  color: WizhColor.eerieBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Expanded(child: child)
              ],
            ),
          ),
          const SizedBox(height: size8),
          // Card.filled(
          //   color: Colors.white,
          //   elevation: 4,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(size12),
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(size12),
          //           child: CachedNetworkImage(
          //             imageUrl:
          //                 "http://pix3.agoda.net/hotelimages/147/147/147_1112051559004767099.jpg?s=312x",
          //             placeholder:
          //                 (context, url) =>
          //                     const Center(child: CircularProgressIndicator()),
          //             errorWidget:
          //                 (context, url, error) => const Icon(Icons.error),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: size8,
          //             vertical: size8,
          //           ),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "Van der Valk Hotel Hildesheim",
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(
          //                   fontSize: size16,
          //                   height: 1.25,
          //                   fontWeight: FontWeight.bold,
          //                   color: WizhColor.eerieBlack,
          //                 ),
          //               ),
          //               const SizedBox(height: size4),
          //               Row(
          //                 children: [
          //                   Text(
          //                     "4",
          //                     style: TextStyle(
          //                       fontSize: size12,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                   ),
          //                   const SizedBox(width: size4),
          //                   for (int i = 0; i < 4; i++)
          //                     Icon(
          //                       Icons.star,
          //                       size: size16,
          //                       color: Colors.yellow,
          //                     ),
          //                   const SizedBox(width: size4),
          //                 ],
          //               ),
          //               const SizedBox(height: size12),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Icon(Icons.location_on, size: size12),
          //                   const SizedBox(width: size4),
          //                   Expanded(
          //                     child: Text(
          //                       "Markt 4, GPS: Jakobistraße 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang",
          //                       maxLines: 3,
          //                       overflow: TextOverflow.ellipsis,
          //                       style: TextStyle(
          //                         fontSize: size12,
          //                         fontWeight: FontWeight.bold,
          //                         color: WizhColor.eerieBlack,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       // Expanded(child: child)
          //     ],
          //   ),
          // ),
          // const SizedBox(height: size8),
          // Card.filled(
          //   color: Colors.white,
          //   elevation: 4,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(size12),
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(size12),
          //           child: CachedNetworkImage(
          //             imageUrl:
          //                 "http://pix3.agoda.net/hotelimages/147/147/147_1112051559004767099.jpg?s=312x",
          //             placeholder:
          //                 (context, url) =>
          //                     const Center(child: CircularProgressIndicator()),
          //             errorWidget:
          //                 (context, url, error) => const Icon(Icons.error),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: size8,
          //             vertical: size8,
          //           ),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "Van der Valk Hotel Hildesheim",
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(
          //                   fontSize: size16,
          //                   height: 1.25,
          //                   fontWeight: FontWeight.bold,
          //                   color: WizhColor.eerieBlack,
          //                 ),
          //               ),
          //               const SizedBox(height: size4),
          //               Row(
          //                 children: [
          //                   Text(
          //                     "4",
          //                     style: TextStyle(
          //                       fontSize: size12,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                   ),
          //                   const SizedBox(width: size4),
          //                   for (int i = 0; i < 4; i++)
          //                     Icon(
          //                       Icons.star,
          //                       size: size16,
          //                       color: Colors.yellow,
          //                     ),
          //                   const SizedBox(width: size4),
          //                 ],
          //               ),
          //               const SizedBox(height: size12),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Icon(Icons.location_on, size: size12),
          //                   const SizedBox(width: size4),
          //                   Expanded(
          //                     child: Text(
          //                       "Markt 4, GPS: Jakobistraße 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang",
          //                       maxLines: 3,
          //                       overflow: TextOverflow.ellipsis,
          //                       style: TextStyle(
          //                         fontSize: size12,
          //                         fontWeight: FontWeight.bold,
          //                         color: WizhColor.eerieBlack,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       // Expanded(child: child)
          //     ],
          //   ),
          // ),
          // const SizedBox(height: size8),
          // Card.filled(
          //   color: Colors.white,
          //   elevation: 4,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(size12),
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(size12),
          //           child: CachedNetworkImage(
          //             imageUrl:
          //                 "http://pix3.agoda.net/hotelimages/147/147/147_1112051559004767099.jpg?s=312x",
          //             placeholder:
          //                 (context, url) =>
          //                     const Center(child: CircularProgressIndicator()),
          //             errorWidget:
          //                 (context, url, error) => const Icon(Icons.error),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: size8,
          //             vertical: size8,
          //           ),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "Van der Valk Hotel Hildesheim",
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(
          //                   fontSize: size16,
          //                   height: 1.25,
          //                   fontWeight: FontWeight.bold,
          //                   color: WizhColor.eerieBlack,
          //                 ),
          //               ),
          //               const SizedBox(height: size4),
          //               Row(
          //                 children: [
          //                   Text(
          //                     "4",
          //                     style: TextStyle(
          //                       fontSize: size12,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                   ),
          //                   const SizedBox(width: size4),
          //                   for (int i = 0; i < 4; i++)
          //                     Icon(
          //                       Icons.star,
          //                       size: size16,
          //                       color: Colors.yellow,
          //                     ),
          //                   const SizedBox(width: size4),
          //                 ],
          //               ),
          //               const SizedBox(height: size12),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Icon(Icons.location_on, size: size12),
          //                   const SizedBox(width: size4),
          //                   Expanded(
          //                     child: Text(
          //                       "Markt 4, GPS: Jakobistraße 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang 8/1 Moo 4 Tumbon Phe Muang",
          //                       maxLines: 3,
          //                       overflow: TextOverflow.ellipsis,
          //                       style: TextStyle(
          //                         fontSize: size12,
          //                         fontWeight: FontWeight.bold,
          //                         color: WizhColor.eerieBlack,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       // Expanded(child: child)
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
