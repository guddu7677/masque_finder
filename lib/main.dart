import 'package:flutter/material.dart';
import 'package:masque_finder/module/authentication/view/location_permision.dart';
import 'package:masque_finder/module/authentication/view/login_screen.dart';
import 'package:masque_finder/module/authentication/view/otp_screen.dart';
import 'package:masque_finder/module/authentication/view/register_profile_screen.dart';
import 'package:masque_finder/module/discoverscreen/view/discover_details_screen.dart';
import 'package:masque_finder/module/discoverscreen/view/discover_screen.dart';
import 'package:masque_finder/module/homescreen/view/card_details_screen.dart';
import 'package:masque_finder/module/homescreen/view/home_screen.dart';
import 'package:masque_finder/module/homescreen/view/main_screen.dart';
import 'package:masque_finder/module/profilescreen/view/about_us_screen.dart';
import 'package:masque_finder/module/profilescreen/view/personal_information_screen.dart';
import 'package:masque_finder/module/profilescreen/view/profile_screen.dart';
import 'package:masque_finder/module/splashscreen/splash_screen.dart';
import 'package:masque_finder/module/splashscreen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        "/SplashScreen": (context) => SplashScreen(),
        "/OnboardingScreen": (context) => OnboardingScreen(),
        "/LoginScreen": (context) => LoginScreen(),
        "/OtpScreen": (context) => OtpScreen(),
        "/RegisterProfileScreen": (context) => RegisterProfileScreen(),
        "/LocationPermision": (context) => LocationPermision(),
        "/MainScreen": (context) => MainScreen(),
        "/HomeScreen": (context) => HomeScreen(),
        "/DiscoverScreen":(context)=>DiscoverScreen(),
        "/ProfileScreen":(context)=>ProfileScreen(),
        "/CardDetailsScreen":(context)=>CardDetailsScreen(),
        "/DiscoverDetailsScreen":(context)=>DiscoverDetailsScreen(),
        "/PersonalInformationScreen":(context)=>PersonalInformationScreen(),
        "/AboutUsScreen":(context)=>AboutUsScreen(),
      },
    );
  }
}
