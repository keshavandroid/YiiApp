import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yii_app/const/color.dart';

import '../common/CustomHeader.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({super.key});

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(
    12.9916,
    77.6951,
  ); // Bangalore coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      body: Stack(
        // appBar: CustomHeader(title: "Select Address"),
        children: [
          CustomHeader(title: "Select Address"),
          /// Background Google Map
          Positioned(
            top: 205,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                color: AppColors.primary,
                child: GoogleMap(
                  onMapCreated: (controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 14.0,
                  ),
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  mapType: MapType.terrain,
                ),
              ),
            ),
          ),



          /// Search Box
          Positioned(
            top: 220,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search Address",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: AppColors.greentextcolor,
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          /// Address Container
          // Positioned(
          //   bottom: 100,
          //   left: 16,
          //   right: 16,
          //   child: Container(
          //     padding: const EdgeInsets.all(16),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(24),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black12,
          //           blurRadius: 6,
          //           offset: Offset(0, 2),
          //         ),
          //       ],
          //     ),
          //     child: Row(
          //       children: const [
          //         Icon(Icons.location_pin, color: Colors.black),
          //         SizedBox(width: 10),
          //         Expanded(
          //           child: Text(
          //             "Akshya Nagar 1st Block 1st Cross,\nRammurthy nagar, Bangalore-560016",
          //             style: TextStyle(fontSize: 14),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          /// Update Button
          Positioned(
            bottom: 30,
            left: 100,
            right: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greentextcolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                // Handle update logic
              },
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom clipper for curved header
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
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
