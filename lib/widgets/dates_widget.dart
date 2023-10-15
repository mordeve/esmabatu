import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatesWidget extends StatelessWidget {
  const DatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double datesFontSize = 14.0;

    return Container(
      // Nikâh: 02.11.2023 14.00 - 15.00
      // Kına: 09.11.2023  19.00 - 23.00
      // Düğün: 11.11.2023 19.00 - 23.00

      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade200,
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Nikâh: ",
                  style: GoogleFonts.quicksand(
                    fontSize: datesFontSize,
                    color: Colors.blueGrey[600],
                  ),
                ),
                TextSpan(
                  text: " 02.11.2023",
                  style: GoogleFonts.quicksand(
                    fontSize: datesFontSize,
                    color: Colors.blueGrey[600],
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Kına:   ",
                  style: GoogleFonts.quicksand(
                    fontSize: datesFontSize,
                    color: Colors.blueGrey[600],
                  ),
                ),
                TextSpan(
                  text: " 09.11.2023",
                  style: GoogleFonts.quicksand(
                    fontSize: datesFontSize,
                    color: Colors.blueGrey[600],
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Düğün: ",
                  style: GoogleFonts.quicksand(
                    fontSize: datesFontSize,
                    color: Colors.blueGrey[600],
                  ),
                ),
                TextSpan(
                  text: " 11.11.2023",
                  style: GoogleFonts.quicksand(
                    fontSize: datesFontSize,
                    color: Colors.blueGrey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
