import 'package:flutter/material.dart';
import 'package:yii_app/Widget/authenticate_screen.dart';
import 'package:yii_app/Widget/loginscreenwithotp.dart';
import 'package:yii_app/Widget/loginscreenwithpass.dart';

import '../const/color.dart';
import 'deliverypersonlogin.dart';

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({super.key});

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Wave Background
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 219,
              child: Image.asset(
                'assets/images/topgn.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          // Bottom Wave Background
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 175,
              child: Image.asset(
                'assets/images/btngreen.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          // Center Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Select User Type",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 300,
                    child: CustomButton(
                      label: "Customer",
                      leading: Image.asset(
                        "assets/images/ic_profile.png",
                        width: 30,
                        height: 30,
                        color: AppColors.greentextcolor1,
                      ),
                      backgroundColor: AppColors.white,
                      textcolor: AppColors.greentextcolor1,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(

                            builder: (context) => const AuthenticateScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: CustomButton(
                      label: "Delivery Personnel",
                      leading: Image.asset(
                        "assets/images/ic_delivery.png",
                        width: 30,
                        height: 30,
                        color: AppColors.white,
                      ),
                      backgroundColor: AppColors.greentextcolor1,
                      textcolor: AppColors.white,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Deliverypersonlogin(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Widget? leading;
  final Color backgroundColor;
  final Color textcolor;
  const CustomButton({
    required this.label,
    required this.onTap,
    this.leading, // 👈 Add this
    this.backgroundColor = const Color(0xFF354D1D),
    this.textcolor = const Color(0xFF354D1D),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 8, // 👈 Adds shadow
        shadowColor: Colors.black.withOpacity(0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32),
          side: BorderSide(
          color: Colors.white, // 👈 Border color
          width: 2,            // 👈 Border width
        ),),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),

      ),
     // child: Text(label, style: TextStyle(fontSize: 18, color: Colors.white)),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 10),
          ],
          Text(
            label,
            style: TextStyle(fontSize: 20, color: textcolor),
          ),
        ],
      ),
    );
  }
}
