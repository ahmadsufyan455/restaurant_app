import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants.dart';
import '../../utils/styles.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Lottie.asset(
          '$lottiePath/soon.json',
          width: 250.0,
        ),
      ),
    );
  }
}
