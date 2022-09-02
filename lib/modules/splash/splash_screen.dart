import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/modules/list/list_restaurants.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('$lottiePath/resto.json', width: 250.0),
            const SizedBox(height: 16.0),
            Text('The Resto', style: GoogleFonts.dancingScript(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }
}

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    moveToNext();
  }

  Future<dynamic> moveToNext() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Get.offNamed(ListRestaurants.routeName);
  }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }
}
