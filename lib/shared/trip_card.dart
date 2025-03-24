import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wizh_trips/entity/trip_entity.dart';
import 'package:wizh_trips/shared/choice_chip.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key, required this.tripData, required this.onTap});

  final TripData tripData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
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
                          image: CachedNetworkImageProvider(
                            tripData.image.first,
                          ),
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
                                                "(${NumberFormat.decimalPattern('id_ID').format(tripData.numberOfReviews)} Reviews)",
                                            style: TextStyle(
                                              color: WizhColor.eerieBlack
                                                  .withValues(alpha: .4),
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
      ),
    );
  }
}
