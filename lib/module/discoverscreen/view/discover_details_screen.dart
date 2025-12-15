import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/module/homescreen/widgets/home_card_widget.dart';
import 'package:masque_finder/module/homescreen/widgets/tab_container.dart';
import 'package:masque_finder/module/homescreen/widgets/weather_widget.dart';

class DiscoverDetailsScreen extends StatefulWidget {
  const DiscoverDetailsScreen({super.key});

  @override
  State<DiscoverDetailsScreen> createState() => _DiscoverDetailsScreenState();
}

class _DiscoverDetailsScreenState extends State<DiscoverDetailsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  
  // Single state variable to control both icons and view
  bool isListView = true; // true = list view, false = map view

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _toggleView() {
    setState(() {
      isListView = !isListView;
    });
    
    // Navigate back to map view when switching from list view
    if (!isListView) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Column(
              children: [
                _buildTopBar(),
                const SizedBox(height: 8),
                _buildFilterTabs(),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Column(
                    children: [
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
                      WeatherWidget(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Column(
                    children: [
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
                      WeatherWidget(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Column(
                    children: [
                      MosqueCard(
                        ontap: () {
                          Navigator.pushNamed(context, "/CardDetailsScreen");
                        },
                        backgroundImage: AppImages.homeBg,
                        type: "Mosque",
                        title: "Jama Masjid",
                        distance: "1.2 km",
                        location: "Delhi, India",
                      ),
                      WeatherWidget(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 125,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  readOnly: false,
                  onTap: () {
                    FocusScope.of(context).requestFocus(_searchFocusNode);
                  },
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Placeholder",
                    hintStyle: AppTextstyle.black14,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF3EC67B),
                        ),
                        child: const Icon(
                          Icons.search,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: isListView ? Colors.grey[300] : Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Filter icon - tapping switches view
                  GestureDetector(
                    onTap: _toggleView,
                    child: Image.asset(
                      isListView ? appSvgimge.filter2 : appSvgimge.filtericon,
                    ),
                  ),

                  const SizedBox(width: 6),
                  
                  // Map icon - tapping switches view
                  GestureDetector(
                    onTap: _toggleView,
                    child: Image.asset(
                      isListView ? appSvgimge.mapicon : appSvgimge.mapicon2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          tabContainer(width: 36, text: "All", colorc: Colors.yellow),
          tabContainer(width: 70, text: "Mosque", colorc: Color(0xFFE8EBEA)),
          tabContainer(
            width: 127,
            text: "Madarsa/Khangah",
            colorc: Color(0xFFE8EBEA),
          ),
          tabContainer(width: 62, text: "Dargah", colorc: Color(0xFFE8EBEA)),
        ],
      ),
    );
  }
}