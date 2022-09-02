import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:restaurant_app/utils/styles.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('$lottiePath/search_data.json', width: 150.0),
        Text('Waiting for search...', style: kBodyBold),
      ],
    );
  }
}
