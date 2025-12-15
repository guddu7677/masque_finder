import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart' show AppTextstyle;
import 'package:masque_finder/core/widgets/appbar_widget.dart';
import 'package:masque_finder/core/widgets/appbarwhite_widget.dart';
import 'package:masque_finder/core/widgets/button_navbar.dart';
import 'package:masque_finder/core/widgets/navigationbar.dart';
import 'package:masque_finder/core/widgets/universel_textfield.dart';
import 'package:masque_finder/module/authentication/widgets/dropdown_widget.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Entire screen white
      appBar: const AppbarwhiteWidget(text: 'Profile Details'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text("Personal Information", style: AppTextstyle.black700f16),
                const SizedBox(height: 24),
                
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Image.asset(AppImages.uploadImg,)),
                  ),
                ),
                const SizedBox(height: 24),

                const UniverselTextfield(
                  text: "Full Name",
                  hinttext: "Enter Full Name",
                ),
                const SizedBox(height: 16),

                const UniverselTextfield(
                  text: "Email",
                  hinttext: "Enter Email",
                ),
                const SizedBox(height: 16),

                const DropdownWidget(
                  text: "Gender",
                  hinttext: "Select your gender",
                ),
                const SizedBox(height: 16),

                const UniverselTextfield(
                  text: "Phone Number",
                  hinttext: "Enter Phone Number",
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationButton(
        text: "Save Changes",
        onTap: () {
          Navigator.pushNamed(context, "/LocationPermision");
        },
      ),
    );
  }
}
