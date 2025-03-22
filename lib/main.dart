import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/env/app_environment.dart';
import 'package:wizh_trips/pages/splash_screen.dart';
import 'package:wizh_trips/pages/trip/trip_landing.dart';

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
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<TripController>(() => TripController(), fenix: true);
        Get.lazyPut<TripCategoryController>(
          () => TripCategoryController(),
          fenix: true,
        );
      }),
      transitionDuration: const Duration(milliseconds: 500),
      getPages: [
        GetPage(name: '/', page: () => TripListPage()),
        GetPage(name: '/splash', page: () => SplashScreen()),
      ],
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
