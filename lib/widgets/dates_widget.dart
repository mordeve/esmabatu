import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatesWidget extends StatelessWidget {
  const DatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Nikâh: 02.11.2023
      // Kına: 08.11.2023
      // Düğün: 11.11.2023
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 40.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade200,
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(0, 5),
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
                    fontSize: 30,
                    color: Colors.blueGrey[600],
                  ),
                ),
                TextSpan(
                  text: " 02.11.2023",
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
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
                    fontSize: 30,
                    color: Colors.blueGrey[600],
                  ),
                ),
                TextSpan(
                  text: " 08.11.2023",
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
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
                    fontSize: 30,
                    color: Colors.blueGrey[600],
                  ),
                ),
                TextSpan(
                  text: " 11.11.2023",
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
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
