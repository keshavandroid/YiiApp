import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double fontSize;
  final double width;
  final FontWeight fontWeight;
  final bool isLoading; // Added loading state

  const CustomRoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 22,
    this.width = double.infinity,
    this.fontWeight = FontWeight.w500,
    this.isLoading = false, // Default: not loading
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: const BorderSide(color: Colors.black),
          // backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: isLoading ? null : onPressed, // Disable when loading
        child: isLoading
            ? const SizedBox(
                height: 24, // Adjust loader size
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  // color: Colors.black,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  // color: Colors.black,
                  fontFamily: "Poppin",
                ),
              ),
      ),
    );
  }
}
