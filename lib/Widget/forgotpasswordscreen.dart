import 'package:flutter/material.dart';
import 'package:yii_app/Widget/authenticate_screen.dart';

import '../const/color.dart';

class Forgotpasswordscreen extends StatefulWidget {
  const Forgotpasswordscreen({super.key});

  @override
  State<Forgotpasswordscreen> createState() => _ForgotpasswordscreenState();
}

class _ForgotpasswordscreenState extends State<Forgotpasswordscreen>
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tabselectedOption == 0 ? "Forgot Password" : "Register",
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: "RobotMedium",
                        color: AppColors.blacktextcolor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tabselectedOption == 0
                          ? "Please enter email address"
                          : "Create Your Account",
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
                            buildTextField('Email Address'),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF3E5622),
                                    // green shade
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text(
                                    'Submit',
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
                    // Tab View content
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child:GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthenticateScreen(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            "Already have an account ? Login",
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.blacktextcolor,
                            ),
                          ),
                        ),
                      )

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
