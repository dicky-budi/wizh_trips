import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wizh_trips/env/app_environment.dart';
import 'package:wizh_trips/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpApp();
  runApp(TripApp());
}

/// The root widget of the application.
///
/// Displays either the [TripListPage] or the [SplashScreen], depending on
/// whether the user has seen the splash screen before.
///
/// The first time the application is launched, it displays the [SplashScreen].
/// Any subsequent launches display the [TripListPage].
///
/// The decision is made by storing a 'first_time' key in the secure storage
/// using the [SecureStorage] class.
///
/// When the key is null, the [SplashScreen] is shown. Otherwise, the
/// [TripListPage] is shown.
class TripApp extends StatefulWidget {
  const TripApp({super.key});

  @override
  TripAppState createState() => TripAppState();
}

class TripAppState extends State<TripApp> {
  @override
  void initState() {
    super.initState();
    checkFirstTime();
  }

  void checkFirstTime() async {
    final firstTime = await SecureStorage().read('first_time');
    if (firstTime == null) {
      Get.rootDelegate.toNamed('/splash');
    } else {
      Get.rootDelegate.toNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Wizh Trips',
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      getPages: [
        GetPage(name: '/', page: () => TripListPage()),
        GetPage(name: '/splash', page: () => SplashScreen()),
      ],
    );
  }
}

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
      // appBar: AppBar(title: Text("Trips")),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Hero(
                tag: trip.title,
                child: Image.network(
                  trip.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(trip.title),
              subtitle: Text(
                "Price: \$${trip.price.toStringAsFixed(2)} | Rating: ${trip.rating}",
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => TripDetailPage(trip: trip),
                //   ),
                // );
              },
            ),
          );
        },
      ),
    );
  }
}

// class TripDetailPage extends StatelessWidget {
//   final Trip trip;

//   TripDetailPage({required this.trip});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(trip.title)),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Hero(
//               tag: trip.title,
//               child: Container(
//                 height: 250,
//                 child: PageView(
//                   children:
//                       trip.images
//                           .map(
//                             (image) => Image.network(image, fit: BoxFit.cover),
//                           )
//                           .toList(),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     trip.title,
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Price: \$${trip.price.toStringAsFixed(2)}",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Rating: ${trip.rating} ⭐",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Summary",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   Text(trip.summary),
//                   SizedBox(height: 16),
//                   Text(
//                     "Includes",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   ...trip.includes.map((item) => Text("- $item")),
//                   SizedBox(height: 16),
//                   Text(
//                     "Excludes",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   ...trip.excludes.map((item) => Text("- $item")),
//                   SizedBox(height: 16),
//                   Text(
//                     "Terms & Conditions",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   Text(trip.terms),
//                   SizedBox(height: 16),
//                   ElevatedButton(onPressed: () {}, child: Text("Book Now")),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
