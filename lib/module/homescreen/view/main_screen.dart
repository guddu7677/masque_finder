import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masque_finder/module/homescreen/provider/navigationprovider.dart';
import 'package:provider/provider.dart';
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
  DateTime? _lastBackPressed;

  static const List<Widget> _pages = [
    HomeScreen(),
    DiscoverScreen(),
    ProfileScreen(),
  ];

  Widget _buildNavIcon({
    required int index,
    required int selectedIndex,
    required String iconPath,
  }) {
    final bool isSelected = selectedIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isSelected)
          Image.asset(
            appSvgimge.navbarUnion,
            height: 20,
            fit: BoxFit.contain,
          ),
        Image.asset(
          iconPath,
          height: 24,
          color: isSelected ? AppColors.greencolor : Colors.grey,
        ),
      ],
    );
  }

  Future<bool> _handleBackPress(BuildContext context, int currentIndex) async {
    if (currentIndex != 0) {
      context.read<NavigationProvider>().navigateToHome();
      return false; 
    }

    final now = DateTime.now();
    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      _lastBackPressed = now;
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Press back again to exit'),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return false; 
    }
    return true; 
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, dynamic result) async {
            if (didPop) return;
            
            final shouldPop = await _handleBackPress(
              context, 
              navigationProvider.selectedIndex,
            );
            
            if (shouldPop && context.mounted) {
              SystemNavigator.pop();
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: _pages[navigationProvider.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: navigationProvider.selectedIndex,
              onTap: (index) => navigationProvider.setIndex(index),
              selectedItemColor: AppColors.greencolor,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: _buildNavIcon(
                    index: 0,
                    selectedIndex: navigationProvider.selectedIndex,
                    iconPath: appSvgimge.navicon,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(
                    index: 1,
                    selectedIndex: navigationProvider.selectedIndex,
                    iconPath: appSvgimge.navicon,
                  ),
                  label: 'Discover',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(
                    index: 2,
                    selectedIndex: navigationProvider.selectedIndex,
                    iconPath: appSvgimge.navicon,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}