import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/core/widgets/button_navbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.appBackGroundColor),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Image.asset(AppImages.loginImge),
                SizedBox(height: 16),
                Text(
                  "Let's set up your profile",
                  style: AppTextstyle.black18bold,
                ),
                SizedBox(height: 8),
                Text(
                  "Sign in to find mosques, prayer times, and stay connected with your local masjid.",
                  style: AppTextstyle.regblack16,
                ),
                SizedBox(height: 24),
                Text("Phone Number", style: AppTextstyle.semiblack14),
                SizedBox(height: 8),
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color:AppColors.greencolor),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Image.asset(appSvgimge.phoneSvg, height: 18, width: 18),
                      SizedBox(width: 8),
                      Container(
                        height: 30,
                        width: 2,
                        color: AppColors.greencolor,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Mobile Number",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBarButton(
        text: "Continue",
        onTap: () {
          Navigator.pushNamed(context, "/OtpScreen");
        },
      ),
    );
  }
}
