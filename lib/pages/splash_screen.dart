import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/route_manager.dart';
import 'package:wizh_trips/env/app_environment.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

/// The first screen that is shown when the app is launched.
///
/// Displays a background image and a call-to-action button to navigate to the
/// [TripScreen].
///
/// The background image is a hotel image asset and is fully expanded to fill the
/// screen. The call-to-action button is a [SwipeButton] with a chevron icon.
/// When swiped, it navigates to the [TripScreen] using the [Get] package.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/bg/splash-hotel.jpg", fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size28,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Text(
                    "Discover the\nWorld with us!",
                    style: TextStyle(
                      color: WizhColor.pearlBush,
                      fontSize: size28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Discover, book, and explore new destinations\nfor unforgettable adventures",
                  style: TextStyle(
                    color: WizhColor.springWood,
                    fontSize: size16,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                SwipeButton(
                  thumbPadding: EdgeInsets.all(size4),
                  thumb: Icon(Icons.chevron_right, color: WizhColor.springWood),
                  elevationThumb: size4,
                  elevationTrack: size4,
                  activeTrackColor: Color(0xFF443C30),
                  activeThumbColor: Color(0xFF9B8774),
                  child: Text(
                    "Let's Go",
                    style: TextStyle(
                      color: WizhColor.springWood,
                      fontSize: size16,
                    ),
                  ),
                  onSwipe: () async {
                    await SecureStorage().save('first_time', 'true');
                    Get.rootDelegate.toNamed('/');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
