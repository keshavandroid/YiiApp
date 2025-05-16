import 'package:flutter/material.dart';

import '../common/CustomHeader.dart';
import '../const/color.dart';

class MyprofileScreen extends StatefulWidget {
  const MyprofileScreen({super.key});

  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen>
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

  // Widget loginOption(String label, int index) {
  //   bool isSelected = selectedOption == index;
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedOption = index;
  //       });
  //     },
  //     child: Row(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.symmetric(vertical: 10),
  //           padding: const EdgeInsets.all(6),
  //           decoration: BoxDecoration(
  //             color:
  //                 isSelected
  //                     ? AppColors.greentextcolor
  //                     : AppColors.greytextcolor,
  //             shape: BoxShape.circle,
  //           ),
  //           child:
  //               isSelected
  //                   ? const Icon(Icons.circle, size: 15, color: Colors.white)
  //                   : const SizedBox(width: 15, height: 15),
  //         ),
  //         const SizedBox(width: 10),
  //         Text(
  //           label,
  //           style: TextStyle(
  //             fontSize: 16,
  //             color: isSelected ? Colors.black : Colors.grey[700],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: CustomHeader(title: "Profile"),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            // below top image
            // above bottom image
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyprofileScreen(),
                                  ),
                                );
                              },
                             child:  ClipOval(
                                child: Image.asset(
                                  'assets/images/ic.jpeg', // Replace with your image path
                                  width: 100, // Set the desired width
                                  height: 100, // Set the desired height
                                  fit: BoxFit.cover, // Ensures the image fits within the circle
                                ),
                              ),
                            ),
                            buildTextField('Username'),
                            buildTextField('Email'),
                            buildTextField('Phone No.'),
                            buildTextField('Password', obscureText: true),
                            buildTextField('Confirm Password', obscureText: true,
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
                                    backgroundColor: const Color(0xFF3E5622),
                                    // green shade
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
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
