import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/env/app_environment.dart';
import 'package:wizh_trips/pages/onboarding.dart';
import 'package:wizh_trips/pages/trip/trip_detail.dart';
import 'package:wizh_trips/pages/trip/trip_landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpApp();
  runApp(TripApp());
}

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
      Get.rootDelegate.toNamed('/onboarding');
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
        Get.lazyPut<TripPopularController>(
          () => TripPopularController(),
          fenix: true,
        );
        Get.lazyPut<TripCategorizedController>(
          () => TripCategorizedController(),
          fenix: true,
        );
        Get.lazyPut<TripCategoryController>(
          () => TripCategoryController(),
          fenix: true,
        );
        Get.lazyPut<TripSelectedController>(
          () => TripSelectedController(),
          fenix: true,
        );
      }),
      transitionDuration: const Duration(milliseconds: 500),
      getPages: [
        GetPage(name: '/', page: () => TripListPage()),
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
        GetPage(name: '/detail', page: () => TripDetailPage()),
      ],
    );
  }
}
