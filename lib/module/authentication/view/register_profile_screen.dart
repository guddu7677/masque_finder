import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart'
    show AppTextstyle;
import 'package:masque_finder/core/widgets/appbar_widget.dart';
import 'package:masque_finder/core/widgets/button_navbar.dart';
import 'package:masque_finder/core/widgets/universel_textfield.dart';
import 'package:masque_finder/module/authentication/provider/auth_provider.dart';
import 'package:masque_finder/module/authentication/widgets/dropdown_widget.dart';
import 'package:masque_finder/module/homescreen/provider/navigationprovider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class RegisterProfileScreen extends StatefulWidget {
  const RegisterProfileScreen({super.key});

  @override
  State<RegisterProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<RegisterProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(text: 'Build Profile'),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.appBackGroundColor),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.profileImage),
                  SizedBox(height: 12),
                  Text(
                    "Let’s set up your profile",
                    style: AppTextstyle.black700f18,
                  ),
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
                  SizedBox(height: 8),
                  UniverselTextfield(
                    text: "Email", hinttext: "Ennter Email"),
                  SizedBox(height: 8),
                  DropdownWidget(
                    text: "Gender",
                    hinttext: "Select your gender",
                    items: ["Male", "Female", "Other"],
                    
                  ),
                  SizedBox(height: 8),
                  UniverselTextfield(
                    
                    keyboardType: TextInputType.number,
                    text: "Age", hinttext: "Enter Your Age"),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBarButton(
        text: "Submit",
        onTap: () {
          context.read<AuthNavigationProvider>().goToLocation(context);
        },
      ),
    );
  }
}
