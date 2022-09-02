import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:restaurant_app/utils/styles.dart';

class NoConnectionState extends StatefulWidget {
  const NoConnectionState({Key? key}) : super(key: key);

  @override
  State<NoConnectionState> createState() => _NoConnectionStateState();
}

class _NoConnectionStateState extends State<NoConnectionState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('$lottiePath/no_internet.json', width: 150.0),
        const SizedBox(height: 16.0),
        Text('Opps.. You\'re Offline', style: kBodyBold),
      ],
    );
  }
}
