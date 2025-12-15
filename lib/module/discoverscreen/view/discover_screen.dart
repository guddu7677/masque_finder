import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/module/homescreen/widgets/home_card_widget.dart';
import 'package:masque_finder/module/homescreen/widgets/tab_container.dart';
import 'package:masque_finder/module/homescreen/widgets/weather_widget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  
  bool isListView = false;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: isListView ? _buildListView() : _buildMapView(),
      ),
    );
  }
  Widget _buildMapView() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AppImages.mapImage, fit: BoxFit.cover),
        ),
        Column(
          children: [
            _buildTopBar(),
            const SizedBox(height: 8),
            _buildFilterTabs(),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Column(
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
        ),
      ],
    );
  }

  Widget _buildListView() {
    return Column(
      children: [
        _buildTopBar(),
        const SizedBox(height: 8),
        _buildFilterTabs(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
              SizedBox(height: 8),
              Column(
                children: [
                  MosqueCard(
                    ontap: () {
                      Navigator.pushNamed(context, "/CardDetailsScreen");
                    },
                    backgroundImage: AppImages.homeBg,
                    type: "Mosque",
                    title: "Makkah Masjid",
                    distance: "2.5 km",
                    location: "Hyderabad, India",
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _toggleView,
                    child: Image.asset(
                      isListView ? appSvgimge.filter2 : appSvgimge.filtericon,
                      color: isListView ? AppColors.yellowcolor : Colors.grey,
                    ),
                  ),

                  const SizedBox(width: 6),
                  
                  GestureDetector(
                    onTap: _toggleView,
                    child: Image.asset(
                      isListView ? appSvgimge.mapicon : appSvgimge.mapicon2,
                      color: isListView ? Colors.grey : AppColors.yellowcolor,
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