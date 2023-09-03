import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class MainController extends GetxController {
  var remTime = "".obs;
  var uuid = const Uuid();

  void calculateRemainingTime() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final future = DateTime(2023, 11, 11, 19, 0, 0).millisecondsSinceEpoch;
    Duration remaining = Duration(milliseconds: future - now);
    remTime.value =
        "${remaining.inDays} gün ${remaining.inHours.remainder(24)} saat ${remaining.inMinutes.remainder(60)} dakika ${remaining.inSeconds.remainder(60)} saniye";
  }

  Future<void> uploadImage(Uint8List image) async {
    final ref = FirebaseDatabase.instance.ref("images/");

    // firebase gets all byte as a value of "img" key I want them inside an array
    final imgToSend = image.toString().replaceAll(", ", "#");

    final img = <String, dynamic>{
      uuid.v4(): imgToSend,
    };

    await ref.set(img);
  }
}
