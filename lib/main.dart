import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:restaurant_app/modules/splash/splash_screen.dart';
import 'package:restaurant_app/routes.dart';
import 'package:restaurant_app/utils/styles.dart';

/*
** Created by Ahmad Sufyan
** initial commit on 2 sept 2022
*/
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kBlackDark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      getPages: routes,
    );
  }
}
