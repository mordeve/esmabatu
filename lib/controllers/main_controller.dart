import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class MainController extends GetxController {
  var remTime = "".obs;
  var uuid = const Uuid();
  Base64Codec base64 = const Base64Codec();

  void calculateRemainingTime() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final future = DateTime(2023, 11, 11, 19, 0, 0).millisecondsSinceEpoch;
    Duration remaining = Duration(milliseconds: future - now);
    remTime.value =
        "${remaining.inDays} gün ${remaining.inHours.remainder(24)} saat ${remaining.inMinutes.remainder(60)} dakika ${remaining.inSeconds.remainder(60)} saniye";
  }

  Future<void> uploadImage(Uint8List image) async {
    final ref = FirebaseDatabase.instance.ref("images/");

    final img = <String, dynamic>{
      uuid.v4(): base64.encode(image),
    };

    await ref.update(img);
  }
}
