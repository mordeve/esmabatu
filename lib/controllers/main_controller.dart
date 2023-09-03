import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var remTime = "".obs;

  void calculateRemainingTime() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final future = DateTime(2023, 11, 11, 19, 0, 0).millisecondsSinceEpoch;
    Duration remaining = Duration(milliseconds: future - now);
    remTime.value =
        "${remaining.inDays} gün ${remaining.inHours.remainder(24)} saat ${remaining.inMinutes.remainder(60)} dakika ${remaining.inSeconds.remainder(60)} saniye";
  }

  void uploadImage(File image) async {
    final ref = FirebaseDatabase.instance.ref("images");

    final img = <String, dynamic>{
      "img": image,
    };

    // DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

    await ref.set(img);
  }
}
