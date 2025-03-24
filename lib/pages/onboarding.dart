import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wizh_trips/env/app_environment.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';
import 'package:wizh_trips/shared/swipe_button.dart';

/// The OnboardingScreen widget is the initial screen that users see when they
/// launch the app for the first time. It includes a background image of a
/// hotel with a call-to-action text overlay and a swipe button. The swipe
/// button allows users to navigate to the main TripScreen. Upon swiping, it
/// also saves a flag in secure storage to indicate that the onboarding screen
/// has been viewed, so subsequent app launches bypass this screen.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/bg/onboarding.jpg", fit: BoxFit.cover),
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
                WizhSwipeButton(
                  text: "Let's Go",
                  onSwipe: () async {
                    await SecureStorage().save('first_time', 'true');
                    Get.rootDelegate.toNamed('/home');
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
