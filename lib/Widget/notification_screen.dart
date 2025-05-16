import 'package:flutter/material.dart';
import 'package:yii_app/Widget/select_address_screen.dart';

import '../common/CustomBottomNavBar.dart';
import '../common/CustomHeader.dart';
import 'AddressCard.dart';
import 'NotificationCard.dart';

class NotificationScreen  extends StatefulWidget {
  const NotificationScreen ({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int selectedAddressIndex = 1;

  final List<String> addresses = [
    "Driver has confirmed xyz order",
    "Driver has confirmed xyz order",
    "Driver has confirmed xyz order",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: CustomHeader(title: "Notifications"),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: ListView.builder(
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            return NotificationCard(
              message: addresses[index],
              onTap: () {
                setState(() {
                  selectedAddressIndex = index;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
