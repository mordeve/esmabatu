import 'package:esmabatu/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.timee}) : super(key: key);

  final String timee;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(200),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFBEBEBE),
                offset: Offset(10, 10),
                blurRadius: 30,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Color.fromARGB(255, 191, 189, 192),
                offset: Offset(-10, -10),
                blurRadius: 30,
                spreadRadius: 1,
              ),
            ]),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border_sharp,
                    color: Colors.purple.shade400,
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    appName,
                    style: GoogleFonts.pacifico(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 6.0),
                  Icon(
                    Icons.favorite_border_sharp,
                    color: Colors.purple.shade400,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.center,
              child: Text(
                timee,
                style: GoogleFonts.pacifico(fontSize: 20),
              ),
            ),
          ],
        ));
  }
}
