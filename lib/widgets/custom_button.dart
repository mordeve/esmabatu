import 'package:esmabatu/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.btnText,
    required this.onPressed,
  });

  final String btnText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 40,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white70,
          minimumSize: kButtonSize,
        ),
        child: Text(
          btnText,
          style: GoogleFonts.quicksand(
            fontSize: kButtonTextSize,
            color: Colors.blueGrey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
