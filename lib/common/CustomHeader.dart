import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget  {
  final String title;

  const CustomHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/top.png'), // Replace with your image path
          fit: BoxFit.fill, // Adjust the image to cover the entire background
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/back.png',height: 40),

          Text(title, style: const TextStyle(color: Colors.white, fontSize: 18),),
          //const Icon(Icons.notifications, color: Colors.white),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(200);
}