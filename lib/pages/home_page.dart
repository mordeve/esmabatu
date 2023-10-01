import 'dart:async';

import 'package:esmabatu/controllers/main_controller.dart';
import 'package:esmabatu/route.dart';
import 'package:esmabatu/widgets/custom_app_bar.dart';
import 'package:esmabatu/widgets/custom_snackbar.dart';
import 'package:esmabatu/widgets/dates_widget.dart';
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
  final TextEditingController senderNameController = TextEditingController();

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
        final XFile imgBytes = pickedFile;
        // ignore: use_build_context_synchronously
        await homeController.uploadImage(
          imgBytes,
          context,
          senderNameController.text,
        );

        ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
          text: "Fotoğrafınız gönderildi! Teşekkür ederiz.",
          duration: const Duration(seconds: 2),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
        text: "Tekrar deneyin!",
        duration: const Duration(seconds: 2),
      ));
      print("Error: $e");
    }
  }

  // open a beautiful dialog and write a note and bottom "Gönder" "İptal" buttons
  Future<void> _writeNote() async {
    String note = "";
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 8,
          content: Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                note = value;
              },
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Notunuzu yazın",
                labelStyle: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                final task = homeController.uploadMessage(
                  note,
                  senderNameController.text,
                  context,
                );
                if (task != null) {
                  ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                    text: "Notunuz gönderildi! Teşekkür ederiz.",
                    duration: const Duration(seconds: 2),
                  ));
                }

                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text("Gönder"),
            ),
          ],
        );
      },
    );
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
                onPressed: () {
                  Get.rootDelegate.offNamed(MyRoute.kinaPage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[400],
                  minimumSize: const Size(200, 50),
                ),
                child: Text("Kına", style: GoogleFonts.quicksand(fontSize: 20)),
              ),
              ElevatedButton(
                onPressed: () async {
                  customBottomModalSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[400],
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  "Fotoğraf / Not",
                  style: GoogleFonts.quicksand(fontSize: 20),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          const DatesWidget(),
        ],
      ),
    ));
  }

  void customBottomModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Fotoğraf/Not Gönder",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: TextField(
                    controller: senderNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "İsminiz",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        _takePhoto();
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[400],
                        minimumSize: const Size(100, 50),
                      ),
                      child: Text(
                        "Fotoğraf",
                        style: GoogleFonts.quicksand(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (senderNameController.text == '') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(CustomSnackBar(
                            text: "Lütfen isminizi giriniz!",
                            duration: const Duration(seconds: 2),
                          ));
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          return;
                        }
                        _writeNote();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[400],
                        minimumSize: const Size(100, 50),
                      ),
                      child: Text(
                        "Not",
                        style: GoogleFonts.quicksand(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
