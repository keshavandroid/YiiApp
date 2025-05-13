import 'package:flutter/material.dart';
import 'package:yii_app/const/color.dart';

import '../common/CustomBottomNavBar.dart';
import '../common/CustomHeader.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({super.key});

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> products = [
    {'image': 'assets/images/tomato.png', 'price': '\$10.00'},
    {'image': 'assets/images/spinach.png', 'price': '\$09.00'},
    {'image': 'assets/images/striped_cucumber.png', 'price': '\$05.00'},
    {'image': 'assets/images/round_gourd.png', 'price': '\$11.00'},
    {'image': 'assets/images/round_gourd.png', 'price': '\$11.00'},
    {'image': 'assets/images/round_gourd.png', 'price': '\$11.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: CustomHeader(title: "Products"),
      body: Stack(
        children: [
          // Custom Header instead of AppBar
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by product name or category',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(2.0),
                        // Optional padding for better alignment
                        child: Image.asset(
                          'assets/images/ic_search.png',
                          // Replace with your asset path
                          width: 54, // Set desired width
                          height: 54, // Set desired height
                          fit: BoxFit.contain, // Adjust fit as needed
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.greysearchcolor,
                    ),
                  ),
                  // Categories
                  SizedBox(height: 20),

                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(products[index]['image'], height: 100),
                            SizedBox(height: 10),
                            Text(
                              'Product Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              products[index]['price'],
                              style: TextStyle(
                                color: AppColors.greentextcolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // body: SingleChildScrollView(
      //   child: Column(
      //
      //   ),
      // ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
