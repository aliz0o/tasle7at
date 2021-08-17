import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tasle7at/ui/home_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff12005e),
      body: Center(
        child: SizedBox(
          //width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 50,
              fontFamily: 'Aclonica',
              color: Colors.white,
              shadows: [],
            ),
            child: AnimatedTextKit(
              onFinished: () {
                Get.off(() => HomeScreen());
              },
              totalRepeatCount: 2,
              animatedTexts: [
                FlickerAnimatedText('tasle7at'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),
      ),
    );
  }
}
