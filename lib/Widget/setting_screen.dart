import 'package:flutter/material.dart';
import 'package:yii_app/Widget/myprofile_screen.dart';
import 'package:yii_app/Widget/select_address_screen.dart';
import 'package:yii_app/const/color.dart';

import '../common/CustomBottomNavBar.dart';
import '../common/CustomHeader.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int selectedAddressIndex = 1;

  final List<String> addresses = [
    "My Profile",
    "About Us",
    "Privacy Policy",
    "Terms and Conditions",
    "Contact Us",
    "Help",
    "Logout",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: CustomHeader(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyprofileScreen(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            "My Profile",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset('assets/images/right_arrow.png',
                          fit: BoxFit.contain,height: 20,color: AppColors.greentextcolor1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),
              // Categories
              GestureDetector(
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            "About us",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset('assets/images/right_arrow.png',
                          fit: BoxFit.contain,height: 20,color: AppColors.greentextcolor1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),
              // Categories
              GestureDetector(
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            "Privacy Policy",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset('assets/images/right_arrow.png',
                          fit: BoxFit.contain,height: 20,color: AppColors.greentextcolor1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              // Categories
              GestureDetector(
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            "Contact us",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset('assets/images/right_arrow.png',
                          fit: BoxFit.contain,height: 20,color: AppColors.greentextcolor1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              // Categories
              GestureDetector(
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            "Logout",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset('assets/images/right_arrow.png',
                          fit: BoxFit.contain,height: 20,color: AppColors.greentextcolor1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
