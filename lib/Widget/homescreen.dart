import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yii_app/const/color.dart';

import '../common/CustomBottomNavBar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> categories = [
    {'image': 'assets/images/egg.png', 'label': 'Egg'},
    {'image': 'assets/images/vegetable.png', 'label': 'Vegetables'},
    {'image': 'assets/images/fish.png', 'label': 'Fish'},
    {'image': 'assets/images/groceries.png', 'label': 'Grocery'},
  ];

  final List<Map<String, dynamic>> products = [
    {'image': 'assets/images/tomato.png', 'price': '\$10.00'},
    {'image': 'assets/images/spinach.png', 'price': '\$09.00'},
    {'image': 'assets/images/striped_cucumber.png', 'price': '\$05.00'},
    {'image': 'assets/images/round_gourd.png', 'price': '\$11.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom Header instead of AppBar
            Container(
              height: 100, // Set desired height of the top image area
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/top.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        top: 10.0,
                        right: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/logo.webp', height: 42),
                          const SizedBox(width: 10),
                          const Text(
                            'Roger & Lydia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/setting.png',
                                height: 35,
                              ),
                              const SizedBox(width: 10),

                              Image.asset(
                                'assets/images/notification.png',
                                height: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
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
                    SizedBox(height: 16),
                    // Categories
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.btncolor,
                            // Set the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Set rounded corners
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ), // Optional padding
                          ),
                          child: Text(
                            'View All',
                            style: TextStyle(
                              color:
                                  Colors
                                      .white, // Replace with your desired color
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        offset: Offset(
                                          0,
                                          5,
                                        ), // Adjust shadow position
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,

                                    child: ClipOval(
                                      child: Image.asset(
                                        categories[index]['image'],
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    // child: Icon(categories[index]['image'],
                                    //   size: 30,
                                    //   color: Colors.orange,
                                    // ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(categories[index]['label']),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),

                    // Partner Products
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Partner Products',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.btncolor,
                            // Set the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Set rounded corners
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ), // Optional padding
                          ),
                          child: Text(
                            'View All',
                            style: TextStyle(
                              color: Colors.white, // Replace with your desired color
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
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
                              Image.asset(
                                products[index]['image'],
                                height: 100,
                              ),
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
      ),

      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
