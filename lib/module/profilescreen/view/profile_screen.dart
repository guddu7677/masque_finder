import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/core/widgets/appbarwhite_widget.dart';
import 'package:masque_finder/module/profilescreen/view/about_us_screen.dart';
import 'package:masque_finder/module/profilescreen/view/faqs_screen.dart';
import 'package:masque_finder/module/profilescreen/view/personal_information_screen.dart';
import 'package:masque_finder/module/profilescreen/view/termcondition_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarwhiteWidget(text: "Profile", bgcolor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0XFFFED700).withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 98,
                    width: 98,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImages.profileImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text("User Name Here", style: AppTextstyle.black700f16),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Text("Personal Information", style: AppTextstyle.black700f16),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PersonalInformationScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFF16302C)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            appSvgimge.profileInfo,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 8),
                          Text("Profile Details", style: AppTextstyle.black14),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text("Policies", style: AppTextstyle.black700f16),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0XFF16302C)),
              ),
              child: Column(
                children: [
                  _buildRowContainer(
                    icon: appSvgimge.aboutusicon,
                    text: "About Us",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AboutUsScreen()),
                      );
                    },
                    showDivider: true,
                  ),
                  _buildRowContainer(
                    icon: appSvgimge.facqicon,
                    text: "FAQ's",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => FaqsScreen()),
                      );
                    },
                    showDivider: true,
                  ),
                  _buildRowContainer(
                    icon: appSvgimge.termicon,
                    text: "Terms & Conditions",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TermconditionScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0XFF16302C)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [Text("Log Out", style: AppTextstyle.black14)],
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowContainer({
    String? icon,
    required String text,
    VoidCallback? onTap,
    bool showDivider = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Row(
              children: [
                if (icon != null) Image.asset(icon, height: 24, width: 24),
                if (icon != null) const SizedBox(width: 12),
                Expanded(child: Text(text, style: AppTextstyle.black14)),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          if (showDivider) const Divider(height: 1, color: Color(0XFF16302C)),
        ],
      ),
    );
  }
}
