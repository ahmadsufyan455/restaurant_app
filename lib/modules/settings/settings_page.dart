import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/modules/settings/settings_controller.dart';

import '../../utils/styles.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: kBlack,
        ),
        backgroundColor: kWhite,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'settings'.tr,
          style: kHeadingRegular,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Theme', style: kHeadingRegular),
                Obx(
                  () => FlutterSwitch(
                    width: 80.0,
                    height: 35.0,
                    valueFontSize: 16.0,
                    toggleSize: 30.0,
                    value: controller.status.value,
                    borderRadius: 30.0,
                    padding: 8.0,
                    showOnOff: true,
                    onToggle: (val) {
                      controller.status.value = val;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
