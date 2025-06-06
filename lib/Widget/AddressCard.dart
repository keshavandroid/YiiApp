import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String address;
  final bool isSelected;
  final VoidCallback onTap;

  const AddressCard({
    Key? key,
    required this.address,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 30),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  address,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  color: isSelected ? const Color(0xFF3A4D1F) : Colors.grey
                      .shade300,
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}