import 'package:flutter/material.dart';
import 'package:masque_finder/module/authentication/view/location_permision.dart';
import 'package:masque_finder/module/authentication/view/login_screen.dart';
import 'package:masque_finder/module/authentication/view/otp_screen.dart';
import 'package:masque_finder/module/authentication/view/profile_screen.dart';
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
        "/OtpScreen":(context)=>OtpScreen(),
        "/ProfileScreen":(context)=>ProfileScreen(),
        "/LocationPermision":(context)=>LocationPermision()
      },
    );
  }
}
