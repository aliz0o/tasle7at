import 'dart:ui';
import 'package:get/get.dart';
import 'en.dart';
import 'ar.dart';

@override
class Translation extends Translations {
  static final locale = Locale('en');

  static final fallbackLocale = Locale('ar');

  static final langs = ['English', 'عربي'];

  static final locales = [
    Locale('en'),
    Locale('ar'),
  ];
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };

  // Gets locale from language, and updates the locale
  Locale changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
    return locale;
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
