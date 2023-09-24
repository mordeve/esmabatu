import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:esmabatu/controllers/main_controller.dart';
import 'package:esmabatu/route.dart';
import 'package:esmabatu/widgets/custom_app_bar.dart';
import 'package:esmabatu/widgets/dates_widget.dart';
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
      final pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 25);

      if (pickedFile != null) {
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
        body: SingleChildScrollView(
      child: Column(
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
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  "Düğün",
                  style: GoogleFonts.quicksand(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.rootDelegate.offNamed(MyRoute.nikahPage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[400],
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  "Nikâh",
                  style: GoogleFonts.quicksand(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _takePhoto();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.blueGrey,
                      content: Text(
                        "Teşekkür ederiz.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  Get.rootDelegate.offNamed(MyRoute.main);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[400],
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  "Fotoğraf Gönder",
                  style: GoogleFonts.quicksand(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[400],
                  minimumSize: const Size(200, 50),
                ),
                child: Text("İletişim",
                    style: GoogleFonts.quicksand(fontSize: 20)),
              ),
            ],
          ),
          const SizedBox(height: 50),
          const DatesWidget(),
        ],
      ),
    ));
  }
}
