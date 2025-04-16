import 'package:flutter/material.dart';
import 'package:yii_app/const/color.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatelessWidget {
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
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.green[300],
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo.png', height: 40),
            Text('Roger & Lydia', style: TextStyle(fontSize: 20)),
            Row(
              children: [
              //  Icon(Icons.settings, color: Colors.white),
                Image.asset('assets/images/setting.png', height: 40),
                SizedBox(width: 10),
                Image.asset('assets/images/notification.png', height: 40),
                SizedBox(width: 10)
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search by product name or category',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),

                    ),
                  filled: true,
                  fillColor: Colors.grey[200],

                ),
              ),
              SizedBox(height: 20),
              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Category',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(onPressed: () {}, child: Text('View All')),
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
                            child:CircleAvatar(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(onPressed: () {}, child: Text('View All')),
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
                            color: Colors.green,
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.greentextcolor,
        // Color for the selected item
        unselectedItemColor: AppColors.blacktextcolor,
        backgroundColor: Colors.white,
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
    );
  }
}
