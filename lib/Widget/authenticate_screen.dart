import 'package:flutter/material.dart';
import 'package:yii_app/Widget/loginscreenwithotp.dart';
import 'package:yii_app/Widget/loginscreenwithpass.dart';

import '../const/color.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen>
    with SingleTickerProviderStateMixin {
  int selectedOption = 0;
  TabController? _tabController;
  int tabselectedOption = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(() {
      setState(() {
        // Update the text or perform any action on tab change
        tabselectedOption = _tabController?.index ?? 0;
        print("Selected tab: $tabselectedOption");
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  Widget loginOption(String label, int index) {
    bool isSelected = selectedOption == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
        });
      },
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AppColors.greentextcolor
                      : AppColors.greytextcolor,
              shape: BoxShape.circle,
            ),
            child:
                isSelected
                    ? const Icon(Icons.circle, size: 15, color: Colors.white)
                    : const SizedBox(width: 15, height: 15),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.black : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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

          Positioned(
            top: 180,
            // below top image
            bottom: 230,
            // above bottom image
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tabselectedOption == 0 ? "Login" : "Register",
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: "RobotMedium",
                        color: AppColors.blacktextcolor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tabselectedOption == 0
                          ? "Welcome back!"
                          : "Create Your Account",
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.blacktextcolor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Tab Bar
                    TabBar(
                      controller: _tabController,
                      labelColor: AppColors.greentextcolor,
                      unselectedLabelColor: AppColors.blacktextcolor,
                      indicatorColor: AppColors.greentextcolor,
                      indicator: UnderlineTabIndicator(
                        borderSide: const BorderSide(
                          width: 4.0,
                          color: AppColors.greentextcolor,
                        ),
                        insets: EdgeInsets.symmetric(
                          horizontal: 120.0,
                        ), // Adjust width by changing insets
                      ),
                      labelStyle: const TextStyle(fontSize: 20),
                      // Set text size for selected tab
                      unselectedLabelStyle: const TextStyle(fontSize: 20),
                      tabs: const [Tab(text: 'Login'), Tab(text: 'Register')],
                    ),
                    const SizedBox(height: 20),
                    // Tab View content
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Login tab content
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              loginOption("Login With Password", 0),
                              loginOption("Login With Otp", 1),
                              const SizedBox(height: 10),
                              Center(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (selectedOption == 0) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    const Loginscreenwithpass(),
                                          ),
                                        );
                                      }
                                      else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    const LoginscreenwithotpScreen(),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2F4512),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 80,
                                        vertical: 10,
                                      ),
                                    ),
                                    child: const Text(
                                      "Next",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: "RobotBold",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            // padding: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  buildTextField('Username'),
                                  buildTextField('Email'),
                                  buildTextField('Phone No.'),
                                  buildTextField('Password', obscureText: true),
                                  buildTextField(
                                    'Confirm Password',
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: 200,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFF3E5622,
                                          ),
                                          // green shade
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Register',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
              width: MediaQuery.of(context).size.width * 0.9,
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
