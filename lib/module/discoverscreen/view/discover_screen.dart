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

  bool isMapView = true;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _showMap() {
    setState(() => isMapView = true);
  }

  void _showList() {
    setState(() => isMapView = false);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: isMapView ? _buildMapView() : _buildListView(),
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
          child: _buildCard(),
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
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) => _buildCard(),
          ),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Column(
      children: [
        MosqueCard(
          ontap: () => Navigator.pushNamed(context, "/CardDetailsScreen"),
          backgroundImage: AppImages.homeBg,
          type: "Mosque",
          title: "Jamia Mosque",
          distance: "453 m",
          location: "Noida Sector 63, Uttar Pradesh",
        ),
        const WeatherWidget(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 125,
      padding:  EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Row(
          children: [
            Expanded(child: _buildSearchField()),
             SizedBox(width: 8),
            _buildToggleIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Start Your Search",
          hintStyle: AppTextstyle.black14,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
          prefixIcon: _circleIcon(Icons.search),
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF3EC67B),
        ),
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }

  Widget _buildToggleIcons() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _toggleIcon(
            isActive: !isMapView,
            onTap: _showList,
            icon: appSvgimge.filtericon,
          ),
          const SizedBox(width: 6),
          _toggleIcon(
            isActive: isMapView,
            onTap: _showMap,
            icon: appSvgimge.mapicon,
          ),
        ],
      ),
    );
  }

  Widget _toggleIcon({
    required bool isActive,
    required VoidCallback onTap,
    required String icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColors.yellowcolor : Colors.grey[300],
        ),
        child: Image.asset(
          icon,
          color: isActive ? Colors.white : Colors.grey,
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
