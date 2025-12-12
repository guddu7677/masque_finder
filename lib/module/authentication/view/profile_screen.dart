import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart' show AppTextstyle;
import 'package:masque_finder/core/widgets/appbar_widget.dart';
import 'package:masque_finder/core/widgets/button_navbar.dart';
import 'package:masque_finder/core/widgets/universel_textfield.dart';
import 'package:masque_finder/module/authentication/widgets/dropdown_widget.dart';
import 'package:pinput/pinput.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(text: 'OTP',),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.appBackGroundColor),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.profileImage),
                  SizedBox(height: 12),
                  Text("Let’s set up your profile", style: AppTextstyle.black700f18),
                  SizedBox(height: 8),
                  Text(
                    "This helps doctors understand you better and ensures smooth appointments.",
                    style: AppTextstyle.regblack16,
                  ),
                  SizedBox(height: 20),
                  UniverselTextfield(
                    text: "Full Name",
                    hinttext: "Ennter Full Name",
                  ),
                  SizedBox(height: 8,),
                   UniverselTextfield(
                    text: "Full Name",
                    hinttext: "Ennter Full Name",
                  ),
                  SizedBox(height: 8,),
                 DropdownWidget(
                  text: "Gender",
                  hinttext: "Select your gender",
                 ),
                   SizedBox(height: 8,),
                   UniverselTextfield(
                    text: "Full Name",
                    hinttext: "Ennter Full Name",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBarButton(
        text: "Verify OTP",
        onTap: () {
          Navigator.pushNamed(context, "/LocationPermision");
        },
      ),
    );
  }
}