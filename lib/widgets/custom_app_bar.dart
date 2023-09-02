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
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 100.0),
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
              padding: const EdgeInsets.only(bottom: 20.0, right: 16, left: 16),
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  Get.find<MainController>().remTime.value,
                  style: GoogleFonts.pacifico(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ));
  }
}
