import 'dart:async';
import 'package:fb_taxi/res/color_manager.dart';
import 'package:fb_taxi/res/font_manager.dart';
import 'package:fb_taxi/screen/auth/auth_controller.dart';
import 'package:fb_taxi/screen/splash/splash.dart';
import 'package:fb_taxi/screen/trip/trip_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    GetStorage();
    Timer(const Duration(seconds: 2), () async {
      var b = await authController.userProfile();
      if (b != null) {
        Get.offAll(const TripScreen());
      } else {
        Get.offAll(const SplashScreen());
      }
    });
    return Scaffold(
      backgroundColor: ColorManager.brown,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: [
            Image.asset(
              'lib/asset/images/street.png',
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
            ),
            Center(
              child: Image.asset(
                'lib/asset/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Taxi',
                    style: FontManager.w600s33cW,
                  ),
                  Text(
                    'تنقل بسرعة و أمان',
                    style: FontManager.w600s33cW,
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Text(
                'في كل مكان وأي مكان نحن معك',
                textAlign: TextAlign.center,
                style: FontManager.w600s33cW,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
