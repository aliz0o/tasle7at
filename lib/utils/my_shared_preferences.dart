import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static SharedPreferences _sharedPreferences;

  init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  String get language => _sharedPreferences.getString(keyLanguage) ?? "en";

  set language(String value) {
    _sharedPreferences.setString(keyLanguage, value);
  }
}

final mySharedPreferences = MySharedPreferences();
const String keyLanguage = "key_language";
