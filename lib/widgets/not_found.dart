import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:restaurant_app/utils/styles.dart';

class NotFoundState extends StatefulWidget {
  const NotFoundState({Key? key}) : super(key: key);

  @override
  State<NotFoundState> createState() => _NotFoundStateState();
}

class _NotFoundStateState extends State<NotFoundState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset('$lottiePath/not_found.json', width: 250.0),
        const SizedBox(height: 16.0),
        Text('No data found!', style: kBodyBold),
      ],
    );
  }
}
