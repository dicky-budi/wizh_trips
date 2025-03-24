import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wizh_trips/env/app_environment.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checkFirstTime();
    });
  }

  void checkFirstTime() async {
    final firstTime = await SecureStorage().read('first_time');
    if (firstTime == null) {
      Get.rootDelegate.toNamed('/onboarding');
    } else {
      Get.rootDelegate.toNamed('/home');
      await SecureStorage().delete("first_time");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg/splash_screen.jpg"),
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wizh",
                style: TextStyle(
                  color: WizhColor.cafe,
                  fontWeight: FontWeight.bold,
                  fontSize: size32,
                ),
              ),
              const SizedBox(width: size8),
              Text(
                "Trips",
                style: TextStyle(
                  color: WizhColor.isabelline,
                  fontWeight: FontWeight.bold,
                  fontSize: size32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
