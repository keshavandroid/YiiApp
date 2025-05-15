import 'package:flutter/material.dart';

import '../common/CustomHeader.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: CustomHeader(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Shipping Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text(
                  "Akshya Nagar 1st Block 1st Cross,\nRamMurthy nagar, Bangalore-560016",
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Add new address logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E4A21),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  "Add New",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Payment Method",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.payment, color: Colors.cyan),
                const SizedBox(width: 8),
                const Text("Mobile Payment"),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked; // Toggle the state
                    });
                  },
                  child: Image.asset(
                    isChecked ? 'assets/images/ic_checked.png' : 'assets/images/ic_unchecked.png',
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Order Summary",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Image.asset(
                  'assets/images/tomato.png',
                  height: 50,
                  width: 50,
                ),
                // Replace with actual image
                title: const Text(
                  "Product Name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Lorem Ipsum is simply dummy text of the.\nQty : 1",
                ),
                trailing: const Text(
                  "\$10.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E4A21),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Select Delivery Date & Time",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text("10 April 2025 , 10:00 AM"),
            const SizedBox(height: 16),
            const Text(
              "Delivery Code",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("#202 4242 47242"),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            // Place order logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E4A21),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Place Order",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
