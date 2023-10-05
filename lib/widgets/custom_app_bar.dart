import 'package:esmabatu/controllers/main_controller.dart';
import 'package:esmabatu/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0xFFBEBEBE),
            offset: Offset(10, 10),
            blurRadius: 30,
            spreadRadius: 2,
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
              padding: const EdgeInsets.only(
                  top: 8.0, left: 12.0, right: 12.0, bottom: 12.0),
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
                    style: GoogleFonts.quicksand(fontSize: 24),
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
              padding: const EdgeInsets.only(bottom: 0.0, right: 16, left: 16),
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  Get.find<MainController>().remTime.value,
                  style: GoogleFonts.quicksand(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ));
  }
}
