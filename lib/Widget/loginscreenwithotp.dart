import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yii_app/Widget/verifyotpscreen.dart';

import '../const/color.dart';
import 'authenticate_screen.dart';

class LoginscreenwithotpScreen extends StatefulWidget {
  const LoginscreenwithotpScreen({super.key});

  @override
  State<LoginscreenwithotpScreen> createState() => _LoginscreenwithotpState();
}

class _LoginscreenwithotpState extends State<LoginscreenwithotpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
          context, '/home'); // Replace with your actual route
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              height: 219,
              child: Image.asset(
                'assets/images/topgn.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          Positioned(
            top: 180,
            // below top image
            bottom: 230,
            // above bottom image
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: "RobotMedium",
                        color: AppColors.blacktextcolor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Welcome back!",
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.blacktextcolor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      // padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            buildTextField('Enter Your Phone Number'),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                            const Verifyotpscreen(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF3E5622),
                                        // green shade
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),

                                      child: const Text(
                                        'Send OTP',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // const SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () { // Add your action here
                                  },
                                  child: const Text(
                                    'Resend Code',
                                    style: TextStyle(
                                      color: AppColors.greentextcolor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                    // Tab View content
                    const SizedBox(height: 50),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          print("Text clicked");
                        },
                        child: Text(
                          "Don’t have an account ? Register",
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.blacktextcolor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              height: 175,
              child: Image.asset(
                'assets/images/btngreen.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }

}

Widget buildTextField(String hint, {bool obscureText = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF3E5622)),
        ),
      ),
    ),
  );
}
