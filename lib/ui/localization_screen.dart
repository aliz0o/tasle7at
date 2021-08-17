import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasle7at/utils/my_shared_preferences.dart';
import 'package:tasle7at/utils/translation.dart';

String _selectedLang = mySharedPreferences.language == 'en'
    ? Translation.langs.first
    : Translation.langs.last;

class LocalizationScreen extends StatefulWidget {
  @override
  _LocalizationScreenState createState() => _LocalizationScreenState();
}

class _LocalizationScreenState extends State<LocalizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('language'.tr),
            SizedBox(height: 20),
            DropdownButton(
              icon: Icon(Icons.arrow_drop_down),
              value: _selectedLang,
              items: Translation.langs.map((String lang) {
                return DropdownMenuItem(value: lang, child: Text(lang));
              }).toList(),
              onChanged: (String value) {
                _selectedLang = value;
                mySharedPreferences.language =
                    Translation().changeLocale(value).toString();

                log(mySharedPreferences.language);
              },
            ),
          ],
        ),
      ),
    );
  }
}
