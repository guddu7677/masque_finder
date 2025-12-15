import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/core/widgets/navigationbar.dart';
import 'package:masque_finder/module/homescreen/widgets/customappbar.dart';
import 'package:masque_finder/module/homescreen/widgets/weather_widget.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({super.key});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 340,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(AppImages.homeBg),
                      fit: BoxFit.cover,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0X00000000),
                        const Color(0XFF000000C4).withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: -5,
                  child:  CustomAppBar(title: "Details"),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 0,
                  child: Row(
                    children: [
                      _imageItem(AppImages.homeDetailsImg1),
                      const SizedBox(width: 8),
                      _imageItem(AppImages.homeDetailsImg2),
                      const SizedBox(width: 8),
                      _imageItem(AppImages.homeDetailsImg3),
                      const SizedBox(width: 8),
                      _imageItem(AppImages.homeDetailsImg4),
                      const SizedBox(width: 8),
                      _imageItem(AppImages.homeDetailsImg5),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Title Mosque Name",
                            style: AppTextstyle.black700f16,
                          ),
                          const SizedBox(width: 6),
                          Container(
                            height: 22,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7EDAC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "444 m",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Noida Sector 63, Uttar Pradesh",
                        style: AppTextstyle.black14,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.yellowcolor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Masque",
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            WeatherWidget(
              borderRadius: BorderRadius.circular(8),
              bgGradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0XFFF7EDAC), Color(0XFFC3F1C6)],
              ),
            ),

            const SizedBox(height: 8),

            Container(
              height: 44,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFFF7EDAC), Color(0XFFC3F1C6)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(appSvgimge.sun1image),
                  const SizedBox(width: 4),
                  Text("Jummah timing: 1:15 PM", style: AppTextstyle.black14),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description:", style: AppTextstyle.green14bold),
                  const SizedBox(height: 8),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                    style: AppTextstyle.black14,
                  ),
                  const SizedBox(height: 16),
                  Text("Facilities:", style: AppTextstyle.green14bold),
                  const SizedBox(height: 8),
                  _facilityItem("Lorem Ipsum is simply dummy text of the printing", appSvgimge.tickIconyellow),
                  _facilityItem("Lorem Ipsum is simply dummy text of the printing", appSvgimge.tickIconyellow),
                  _facilityItem("Lorem Ipsum is simply dummy text of the printing", appSvgimge.tickIconyellow),
                  _facilityItem("Lorem Ipsum is simply dummy text of the printing", appSvgimge.tickIconyellow),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),

     bottomNavigationBar: NavigationButton(
  text: "Get Direction on Map",
  onTap: () {},
),
 );
  }

  Widget _imageItem(String image) {
    return Container(
      height: 58,
      width: 58,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _facilityItem(String text, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Image.asset(icon, height: 18, width: 18),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: AppTextstyle.black14,
            ),
          ),
        ],
      ),
    );
  }
}
