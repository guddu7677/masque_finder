import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/module/homescreen/widgets/home_card_widget.dart';
import 'package:masque_finder/module/homescreen/widgets/tab_container.dart';
import 'package:masque_finder/module/homescreen/widgets/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              _buildHeader(),
              _buildNearbyTitle(),
              _buildFilterTabs(),

              const SizedBox(height: 8),
              MosqueCard(
                ontap: () {
                  Navigator.pushNamed(context, "/CardDetailsScreen");
                },
                backgroundImage: AppImages.homeBg,
                type: "Mosque",
                title: "Jamia Mosque",
                distance: "453 m",
                location: "Noida Sector 63, Uttar Pradesh",
              ),
              WeatherWidget(),
              SizedBox(height: 8),
              MosqueCard(
                  ontap: () {
                  Navigator.pushNamed(context, "/CardDetailsScreen");
                },
                backgroundImage: AppImages.homeBg,
                type: "Mosque",
                title: "Jamia Mosque",
                distance: "453 m",
                location: "Noida Sector 63, Uttar Pradesh",
              ),
              SizedBox(height: 8),
              MosqueCard(
                  ontap: () {
                  Navigator.pushNamed(context, "/CardDetailsScreen");
                },
                backgroundImage: AppImages.homeBg,
                type: "Mosque",
                title: "Jamia Mosque",
                distance: "453 m",
                location: "Noida Sector 63, Uttar Pradesh",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: SizedBox(
        height: 220,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppImages.homeBg, fit: BoxFit.cover),
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.primaryColor.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 19,
                          backgroundImage: AssetImage(AppImages.homProfileImg),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back!",
                              style: AppTextstyle.white700f16,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 15,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Current Location here",
                                  style: AppTextstyle.white14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "01 ",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 18.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const TextSpan(
                              text: "Jumada Al-Awwal 1447",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.5,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        "04:31 PM",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: Text("Current time", style: AppTextstyle.white14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbyTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Nearby Mosque", style: AppTextstyle.black700f18),
          Container(
            height: 21,
            width: 58,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.yellowcolor.withOpacity(0.5),
            ),
            child: Text("See All", style: AppTextstyle.regular12black),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tabContainer(width: 34, text: "All", colorc: AppColors.yellowcolor),
          tabContainer(
            width: 68,
            text: "Mosque",
            colorc: AppColors.greycontainerBg,
          ),
          tabContainer(
            width: 125,
            text: "Madarsa/Khangah",
            colorc: AppColors.greycontainerBg,
          ),
          tabContainer(
            width: 60,
            text: "Dargah",
            colorc: AppColors.greycontainerBg,
          ),
        ],
      ),
    );
  }
}
