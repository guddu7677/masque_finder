import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/core/widgets/appbarwhite_widget.dart';
import 'package:masque_finder/core/widgets/navigationbar.dart';
import 'package:masque_finder/core/widgets/universel_textfield.dart';
import 'package:masque_finder/module/authentication/widgets/dropdown_widget.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppbarwhiteWidget(text: 'Profile Details'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  child: Center(child: Image.asset(AppImages.uploadImg)),
                ),
              ),

              const SizedBox(height: 24),

              const UniverselTextfield(
                text: "Full Name",
                hinttext: "Enter Full Name",
              ),

              const SizedBox(height: 16),

              const UniverselTextfield(text: "Email", hinttext: "Enter Email"),

              const SizedBox(height: 16),

              DropdownWidget(
                text: "Gender",
                hinttext: "Select your gender",
                items: const ["Male", "Female", "Other"],
              ),

              const SizedBox(height: 16),

              Text("Phone Number", style: AppTextstyle.semiblack14),

              const SizedBox(height: 8),

              Container(
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.greencolor),
                ),
                padding: const EdgeInsets.only(left: 12, bottom: 15),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Mobile Number",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavigationButton(
        text: "Save Changes",
        onTap: () {
          Navigator.pushNamed(context, "/MainScreen");
        },
      ),
    );
  }
}
