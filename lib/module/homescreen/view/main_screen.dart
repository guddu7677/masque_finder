import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/module/discoverscreen/view/discover_screen.dart';
import 'package:masque_finder/module/homescreen/view/home_screen.dart';
import 'package:masque_finder/module/profilescreen/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    DiscoverScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavIcon({
    required int index,
    required String iconPath,
  }) {
    final bool isSelected = _selectedIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isSelected)
          Image.asset(
            appSvgimge.navbarUnion,
            height: 20,
            fit: BoxFit.contain,
          ),

        // const SizedBox(height: 4),

        Image.asset(
          iconPath,
          height: 24,
          color: isSelected ? AppColors.greencolor : Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.greencolor,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              index: 0,
              iconPath: appSvgimge.navicon,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              index: 1,
              iconPath: appSvgimge.navicon,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              index: 2,
              iconPath: appSvgimge.navicon,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
