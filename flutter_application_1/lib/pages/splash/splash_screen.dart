import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/share/components/custom_extension.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

import '../../generated/l10n.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "splash";
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var local =S.of(context);
    Timer(const Duration(seconds: 3), () {
      //Navigator
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icon_splash.png",
                ),
                10.height,
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('N E W S'),
                    ],
                    isRepeatingAnimation: true,
                  ),
                )
              ],
            ),
          ),
          Image.asset(
            "assets/images/background.png",
            fit: BoxFit.cover,
            width: mediaQuery.width,
            height: mediaQuery.height,
          )
        ],
      ),
    );
  }
}
