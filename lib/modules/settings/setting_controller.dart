import 'package:get/get.dart';

class SettingController {
  final RxBool _isScheduled = false.obs;

  bool get isScheduled => _isScheduled.value;

  void scheduleRestaurant(bool value) {
    _isScheduled.value = value;
    if (_isScheduled.value) {
      Get.snackbar('reminder', 'reminder at 11');
    } else {
      Get.snackbar('reminder', 'reminder cancel');
    }
  }
}
