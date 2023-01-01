import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/modules/settings/setting_controller.dart';

import '../../utils/styles.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
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
      body: Obx(
        () => Column(
          children: [
            ListTile(
              title: Text(
                'reminder'.tr,
                style: kBodyRegular,
              ),
              trailing: Switch.adaptive(
                value: controller.isScheduled,
                onChanged: (value) {
                  controller.scheduleRestaurant(value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
