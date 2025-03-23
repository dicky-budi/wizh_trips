import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:wizh_trips/pages/trip/categorized_trip.dart';
import 'package:wizh_trips/pages/trip/popular_trip.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class TripListPage extends StatelessWidget {
  const TripListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
