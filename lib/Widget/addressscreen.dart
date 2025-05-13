import 'package:flutter/material.dart';
import 'package:yii_app/Widget/select_address_screen.dart';

import '../common/CustomBottomNavBar.dart';
import '../common/CustomHeader.dart';
import 'AddressCard.dart';

class AddressScreen  extends StatefulWidget {
  const AddressScreen ({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int selectedAddressIndex = 1;

  final List<String> addresses = [
    "Akshya Nagar 1st Block 1st Cross,\nRamamurthy nagar, Bangalore-560016",
    "Akshya Nagar 1st Block 1st Cross,\nRamamurthy nagar, Bangalore-560016",
    "Akshya Nagar 1st Block 1st Cross,\nRamamurthy nagar, Bangalore-560016",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: CustomHeader(title: "Address"),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: ListView.builder(
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            return AddressCard(
              address: addresses[index],
              isSelected: selectedAddressIndex == index,
              onTap: () {
                setState(() {
                  selectedAddressIndex = index;
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectAddressScreen()),
            );
        },
        backgroundColor: const Color(0xFF39B9BC),
        child: const Icon(Icons.add, size: 32, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
       bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }
}
