import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:restaurant_app/utils/date_time_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/background_service.dart';
import '../../utils/notification_helper.dart';

class SettingController extends GetxController {
  final RxBool _isScheduled = false.obs;

  bool get isScheduled => _isScheduled.value;

  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(reminderKey) != null) {
      _isScheduled.value = true;
    }
  }

  Future<bool> scheduleRestaurant(bool value) async {
    _isScheduled.value = value;
    if (_isScheduled.value) {
      prefs.setBool(reminderKey, value);
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      prefs.remove(reminderKey);
      return await AndroidAlarmManager.cancel(1);
    }
  }

  @override
  void onClose() {
    super.onClose();
    selectNotificationSubject.close();
  }
}
