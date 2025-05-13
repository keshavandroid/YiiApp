import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: 99, // Set desired height of the top image area
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/top.png'),

            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                children: [

                  GestureDetector(
                    onTap: () {
                      // Handle the click event here
                      print('Back button clicked');
                      Navigator.pop(context); // Example: Navigate back
                    },
                    child: Image.asset('assets/images/back.png', height: 42),
                  ),                  // Space between back button and title
                  Expanded(
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(170);
}

// const Center(
//   child: Align(
//     alignment: Alignment.topCenter,
//     child: Text(
//       'Address',
//       style: TextStyle(
//         fontSize: 18,
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// ),
