import 'dart:async';

import 'package:esmabatu/controllers/main_controller.dart';
import 'package:esmabatu/route.dart';
import 'package:esmabatu/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final homeController = Get.find<MainController>();
  String _remainingTime() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final future = DateTime(2023, 11, 11, 19, 0, 0).millisecondsSinceEpoch;
    Duration remaining = Duration(milliseconds: future - now);
    return "${remaining.inDays} gün ${remaining.inHours.remainder(24)} saat ${remaining.inMinutes.remainder(60)} dakika ${remaining.inSeconds.remainder(60)} saniye";
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(milliseconds: 1000),
      (Timer t) => homeController.calculateRemainingTime(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const CustomAppBar(),
        const SizedBox(height: 50),
        Wrap(
          spacing: 30,
          runSpacing: 30,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.rootDelegate.offNamed(MyRoute.weddingPage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[400],
                textStyle: GoogleFonts.pacifico(fontSize: 20),
                minimumSize: const Size(200, 50),
              ),
              child: const Text("Düğün"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[400],
                textStyle: GoogleFonts.pacifico(fontSize: 20),
                minimumSize: const Size(200, 50),
              ),
              child: const Text("Nikâh"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[400],
                textStyle: GoogleFonts.pacifico(fontSize: 20),
                minimumSize: const Size(200, 50),
              ),
              child: const Text("Fotoğraf Gönder"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[400],
                textStyle: GoogleFonts.pacifico(fontSize: 20),
                minimumSize: const Size(200, 50),
              ),
              child: const Text("İletişim"),
            ),
          ],
        ),
      ],
    ));
  }
}
