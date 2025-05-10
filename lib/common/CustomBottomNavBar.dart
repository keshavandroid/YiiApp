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
    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: Material(
        color: Colors.black12,
        elevation: 15,
        shadowColor:  Colors.black.withOpacity(0.2), // Visible shadow
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
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
          ),
        ),
      ),

    );
  }
}
