import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class FavoriteRestaurant extends StatelessWidget {
  const FavoriteRestaurant({Key? key}) : super(key: key);

  static const routeName = '/favorite';

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
          'favourites'.tr,
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
