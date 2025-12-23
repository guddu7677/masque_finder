import 'dart:async';

import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, "/OnboardingScreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 180,
            child: Image.asset(appSvgimge.splashLogo),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppImages.splashimage1, fit: BoxFit.cover),
          ),

          Positioned(
            bottom: 40,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Image.asset(appSvgimge.loadingSvg, height: 38, width: 38),
                SizedBox(height: 16),
                Text(
                  "Welcome to Mosque Finder!",
                  style: AppTextstyle.semiWhite14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
