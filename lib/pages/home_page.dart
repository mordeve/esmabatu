import 'dart:async';
import 'dart:io';

import 'package:esmabatu/controllers/main_controller.dart';
import 'package:esmabatu/route.dart';
import 'package:esmabatu/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final homeController = Get.find<MainController>();

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (Timer t) => homeController.calculateRemainingTime(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  final ImagePicker picker = ImagePicker();

  Future<void> _takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      var img = File(pickedFile.path);
    }
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
              onPressed: () {
                _takePhoto();
              },
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
