import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:wizh_trips/pages/trip/categorized_trip.dart';
import 'package:wizh_trips/pages/trip/popular_trip.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class Trip {
  final String title;
  final String imageUrl;
  final double price;
  final double rating;
  final List<String> images;
  final String summary;
  final List<String> includes;
  final List<String> excludes;
  final String terms;

  Trip({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.images,
    required this.summary,
    required this.includes,
    required this.excludes,
    required this.terms,
  });
}

class TripListPage extends StatelessWidget {
  TripListPage({super.key});

  final List<Trip> trips = [
    Trip(
      title: "Bali Getaway",
      imageUrl:
          "https://ik.imagekit.io/tvlk/blog/2023/09/shutterstock_631736717.jpg",
      price: 199.99,
      rating: 4.5,
      images: [
        "https://ik.imagekit.io/tvlk/blog/2023/09/shutterstock_631736717.jpg",
        "https://ik.imagekit.io/tvlk/blog/2023/09/shutterstock_631736717.jpg",
        "https://ik.imagekit.io/tvlk/blog/2023/09/shutterstock_631736717.jpg",
      ],
      summary: "Experience the best of Bali with this amazing trip!",
      includes: ["Hotel Stay", "Breakfast", "Airport Transfer"],
      excludes: ["Flights", "Personal Expenses"],
      terms: "No refund on cancellation within 7 days of departure.",
    ),
    Trip(
      title: "Mountain Escape",
      imageUrl:
          "https://cdn1.healthians.com/blog/wp-content/uploads/2019/07/407.jpg",
      price: 149.99,
      rating: 4.7,
      images: [
        "https://cdn1.healthians.com/blog/wp-content/uploads/2019/07/407.jpg",
        "https://cdn1.healthians.com/blog/wp-content/uploads/2019/07/407.jpg",
        "https://cdn1.healthians.com/blog/wp-content/uploads/2019/07/407.jpg",
      ],
      summary: "A thrilling adventure in the mountains with guided hikes!",
      includes: ["Guided Tour", "Meals", "Camp Stay"],
      excludes: ["Gear Rental", "Transport"],
      terms: "Full refund available up to 14 days before departure.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       Icon(Icons.pin_drop, size: size24),
      //       const SizedBox(width: size8),
      //       Text(
      //         "Indonesia, Surabaya",
      //         style: TextStyle(fontSize: size16, fontWeight: FontWeight.bold),
      //       ),
      //     ],
      //   ),
      //   backgroundColor: WizhColor.pearlBush,
      // ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: WizhColor.gradientLinearBg),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: size12,
              vertical: size8,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discover Your",
                        style: TextStyle(
                          height: 1,
                          fontSize: size20,
                          color: WizhColor.eerieBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Next ",
                            style: TextStyle(
                              fontSize: size20,
                              color: WizhColor.eerieBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: size4),
                          TypeWriter(
                            controller: TypeWriterController.fromValue(
                              TypeWriterValue(["Stay!", "Food!"]),
                              duration: Duration(milliseconds: 400),
                              repeat: true,
                              autorun: true,
                            ),
                            builder:
                                (context, value) => Text(
                                  value.text,
                                  style: TextStyle(
                                    fontSize: size24,
                                    letterSpacing: 2,
                                    color: WizhColor.eerieBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: size8),
                  TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: TextEditingController(),
                    cursorColor: WizhColor.eerieBlack,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: "Search here",
                      hintStyle: TextStyle(fontSize: size16),
                      prefixIcon: Icon(Icons.search, size: size20),
                      prefixIconColor: WizhColor.eerieBlack,
                      prefixIconConstraints: BoxConstraints(
                        maxWidth: size32,
                        minWidth: size32,
                        maxHeight: size40,
                        minHeight: size40,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: WizhColor.eerieBlack),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: WizhColor.eerieBlack),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: WizhColor.eerieBlack),
                      ),
                    ),
                  ),
                  const SizedBox(height: size12),
                  PopularTrip(),
                  CategorizedTrip(),
                  // ListView.builder(
                  //   itemCount: trips.length,
                  //   itemBuilder: (context, index) {
                  //     final trip = trips[index];
                  //     return Card(
                  //       margin: EdgeInsets.all(10),
                  //       child: ListTile(
                  //         leading: Hero(
                  //           tag: trip.title,
                  //           child: Image.network(
                  //             trip.imageUrl,
                  //             width: 80,
                  //             height: 80,
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //         title: Text(trip.title),
                  //         subtitle: Text(
                  //           "Price: \$${trip.price.toStringAsFixed(2)} | Rating: ${trip.rating}",
                  //         ),
                  //         onTap: () {
                  //           // Navigator.push(
                  //           //   context,
                  //           //   MaterialPageRoute(
                  //           //     builder: (context) => TripDetailPage(trip: trip),
                  //           //   ),
                  //           // );
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
