import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/core/widgets/button_navbar.dart';

class LocationPermision extends StatefulWidget {
  const LocationPermision({super.key});

  @override
  State<LocationPermision> createState() => _LocationPermisionState();
}

class _LocationPermisionState extends State<LocationPermision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.appBackGroundColor),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.locationImg),

            const SizedBox(height: 20),

            Text(
              "Required Permission for your location",
              style: AppTextstyle.black700f18,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "We use your location to show services available in your area and speed up the setup.",
                style: AppTextstyle.black14,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarButton(
        text: "Allow Location",
        onTap: () {
          Navigator.pushNamed(context, "/MainScreen");
        },
      ),
    );
  }
}
