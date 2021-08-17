import 'package:flutter/material.dart';
import 'package:tasle7at/ui/splash_screen.dart';
import 'package:get/get.dart';
import 'package:tasle7at/utils/my_shared_preferences.dart';
import 'package:tasle7at/utils/translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mySharedPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (mySharedPreferences.language == "") {
      if (Get.locale == null) {
        mySharedPreferences.language = 'en';
      } else {
        String language = Get.locale.languageCode;
        if (language != 'en' || language != 'ar') {
          mySharedPreferences.language = 'en';
        } else {
          mySharedPreferences.language = language;
        }
      }
    }

    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Lalezar',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 23, color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xff12005e),
        ),
      ),
      home: SplashScreen(),
      locale: Locale(mySharedPreferences.language),
      fallbackLocale: Translation.fallbackLocale,
      translations: Translation(),
    );
  }
}
