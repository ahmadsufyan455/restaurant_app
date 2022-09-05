import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:restaurant_app/utils/styles.dart';

class AuthorProfile extends StatelessWidget {
  const AuthorProfile({Key? key}) : super(key: key);

  static const routeName = '/profile';

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
          'Author Profile',
          style: kHeadingRegular,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 75.0,
                  backgroundImage: AssetImage(
                    '$imagePath/fyn.jpg',
                  ),
                ),
                const SizedBox(height: 16.0),
                Text('Ahmad Sufyan', style: kHeadingBold),
                const SizedBox(height: 4.0),
                Text('ahmadsufyan514@gmail.com', style: kBodyRegular),
                const SizedBox(height: 16.0),
                Text(
                  '🔭 Currently working on Android Project, Debugging, Maintaining, and Bug Fixing',
                  style: kBodyRegular,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '🌱 Currently learning Kotlin and Flutter for Mobile Development 😊',
                  style: kBodyRegular,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '👯 Looking to collaborate with other to code or to make content',
                  style: kBodyRegular,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '⛳️ 2022 Goals: Being Full-Time Mobile Developer and contribute to open source',
                  style: kBodyRegular,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '⚡ Fun fact: I love to reading book about self-development',
                  style: kBodyRegular,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
