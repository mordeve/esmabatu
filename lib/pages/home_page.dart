import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:esmabatu/controllers/main_controller.dart';
import 'package:esmabatu/route.dart';
import 'package:esmabatu/widgets/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
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
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        // get image bytes
        final Uint8List imgBytes = await pickedFile.readAsBytes();
        await homeController.uploadImage(imgBytes);
      }
    } catch (e) {
      print("Error: $e");
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Fotoğraf yüklendi"),
                    duration: Duration(seconds: 4),
                  ),
                );
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
