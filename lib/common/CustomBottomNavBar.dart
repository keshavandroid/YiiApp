import 'package:flutter/material.dart';
import 'package:yii_app/Widget/homescreen.dart';

import '../Widget/addressscreen.dart';
import '../const/color.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  void onTabTapped(int index) {
    if (index == widget.currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Homescreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Homescreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Homescreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AddressScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: onTabTapped,
      selectedItemColor: AppColors.greentextcolor,
      unselectedItemColor: AppColors.blacktextcolor,
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/ic_home.png'),
            color: AppColors.greentextcolor,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/ic_history.png'),
            color: AppColors.blacktextcolor,
          ),
          label: "History",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/ic_cart.png'),
            color: AppColors.blacktextcolor,
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/ic_profile.png'),
            color: AppColors.blacktextcolor,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
