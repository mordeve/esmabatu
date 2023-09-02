import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainController extends GetxController {
  var remTime = "".obs;

  void calculateRemainingTime() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final future = DateTime(2023, 11, 11, 19, 0, 0).millisecondsSinceEpoch;
    Duration remaining = Duration(milliseconds: future - now);
    remTime.value =
        "${remaining.inDays} gün ${remaining.inHours.remainder(24)} saat ${remaining.inMinutes.remainder(60)} dakika ${remaining.inSeconds.remainder(60)} saniye";
  }
}
