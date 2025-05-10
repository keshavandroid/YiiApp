import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yii_app/Widget/authenticate_screen.dart';
import 'package:yii_app/Widget/forgotpasswordscreen.dart';
import 'package:yii_app/Widget/loginscreenwithpass.dart';
import 'package:yii_app/Widget/veriftotpscreen.dart';

import 'loginscreenwithotp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthenticateScreen(),
          ),
        );
       // Replace with your actual route
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
      backgroundColor: Colors.white, // Change to match your branding
      body: Stack(
        children: [
          // Top-right corner image
          Positioned(
            top: -15,
            right: 0,
            child: Container(
              width: 340,
              height: 286,
              child: Image.asset('assets/images/topgreen.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Center image
          Center(
            child: Image.asset(
              'assets/images/logo.webp', // Replace with your middle image path
              width: 294,
              height: 271,
            ),
          ),
          // Bottom-right corner image
          Positioned(
            bottom: -10,
            right: -14,
            child: Container(
              width: 425,
              height: 230,
              child: Image.asset('assets/images/bottomgreen.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
