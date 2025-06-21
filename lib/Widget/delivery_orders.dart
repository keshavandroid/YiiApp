import 'package:flutter/material.dart';

import '../common/CustomBottomNavBar.dart';
import '../common/CustomHeader.dart';
import '../const/color.dart';

class DeliveryOrders extends StatefulWidget {
  const DeliveryOrders({super.key});

  @override
  State<DeliveryOrders> createState() => _DeliveryOrdersState();
}

class _DeliveryOrdersState extends State<DeliveryOrders> {
  final List<Map<String, dynamic>> orderList = [
    {
      'image': 'assets/images/tomato.png',
      'name': 'Red Apple',
      'qty': 1,
      'date': '04 April',
      'time': '10:00 AM',
      'price': 10.0,
      'address': 'Akshya Nagar 1st Block 1st Cross,Rummy cross circle',
    },
    {
      'image': 'assets/images/round_gourd.png',
      'name': 'Green Apple',
      'qty': 2,
      'date': '05 April',
      'time': '11:00 AM',
      'price': 12.0,
      'address': 'Akshya Nagar 1st Block 1st Cross,Rummy cross circle',
    },
    {
      'image': 'assets/images/vegetable.png',
      'name': 'Orange',
      'qty': 3,
      'date': '06 April',
      'time': '09:00 AM',
      'price': 15.0,
      'address': 'Akshya Nagar 1st Block 1st Cross,Rummy cross circle',
    },
    {
      'image': 'assets/images/spinach.png',
      'name': 'Spinach',
      'qty': 1,
      'date': '07 April',
      'time': '08:00 AM',
      'price': 8.0,
      'address': 'Akshya Nagar 1st Block 1st Cross,Rummy cross circle',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: CustomHeader(title: 'Orders'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                final order = orderList[index];
                return OrderCard(
                  imagePath: order['image'],
                  name: order['name'],
                  qty: order['qty'],
                  date: order['date'],
                  time: order['time'],
                  price: order['price'],
                  address: order['address'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final int qty;
  final String date;
  final String time;
  final double price;
  final String address;

  const OrderCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.qty,
    required this.date,
    required this.time,
    required this.price,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$${price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.greentextcolor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Qty : $qty",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      // Slight adjustment if needed
                     child:Image.asset(
                        'assets/images/ic_location.png',
                        width: 16,
                        height: 16,
                        color: Colors.black, // optional tint
                      ),
                    ),

                    const SizedBox(width: 4), // spacing between icon and text
                    Expanded(
                      child: Text(
                        "$address",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/clock.png',
                      width: 16,
                      height: 16,
                      color: Colors.black, // optional tint
                    ),
                    const SizedBox(width: 4), // spacing between icon and text
                    Text(
                      "$date , $time",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                // Text(
                //   "$date , $time",
                //   style: const TextStyle(color: Colors.black54, fontSize: 16),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
