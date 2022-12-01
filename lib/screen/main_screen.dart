import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:monews/constants/constants.dart';
import 'package:monews/screen/home_screen.dart';
import 'package:monews/screen/explore_screen.dart';
import 'package:monews/screen/marked_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      extendBody: true,
      bottomNavigationBar: _getBottomNavigation(),
      body: IndexedStack(
        index: _selectedItem,
        children: _getScreens(),
      ),
    );
  }

  List<Widget> _getScreens() {
    return [
      HomeScreen(),
      ExploreScreen(),
      MarkedScreen(),
    ];
  }

  Widget _getBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: whiteColor,
      currentIndex: _selectedItem,
      onTap: (index) {
        setState(() {
          _selectedItem = index;
        });
      },
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: SvgPicture.asset(
            "assets/icons/home.svg",
            color: greyColor,
          ),
          activeIcon: SvgPicture.asset(
            "assets/icons/home-fill.svg",
            color: primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: SvgPicture.asset(
            "assets/icons/discover.svg",
            color: greyColor,
          ),
          activeIcon: SvgPicture.asset(
            "assets/icons/discover-fill.svg",
            color: primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: SvgPicture.asset(
            "assets/icons/save.svg",
            color: greyColor,
          ),
          activeIcon: SvgPicture.asset(
            "assets/icons/save-fill.svg",
            color: primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: SvgPicture.asset(
            "assets/icons/profile.svg",
            color: greyColor,
          ),
          activeIcon: SvgPicture.asset(
            "assets/icons/profile-fill.svg",
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
