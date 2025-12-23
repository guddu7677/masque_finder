import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/module/splashscreen/widgets/slide_continue.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded( 
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  right: 0,
                  left: 0,
                  child: Image.asset(AppImages.bgInsullation),
                ),
                
                Positioned(
                  top: 0,bottom: 80,
                  left: 0,
                  right: 0,
                  child: Image.asset(AppImages.splash2Imge,fit: BoxFit.contain,),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 240,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0XFFF7EDAC).withOpacity(0.6),
                        Color(0XFFC3F1C6).withOpacity(0.6),
                      ]),
                      borderRadius:  BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text("Welcome to masque finder",style: AppTextstyle.black18bold,),
                            SizedBox(height: 16,),
                           Text("Easily find nearby mosques wherever you are, get accurate daily prayer times based on your location, and stay connected with your local masjid and community—all in one place.",style: AppTextstyle.regblack16,),
                      SizedBox(height: 16,),
                      SlideToContinue()
                      ],),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
