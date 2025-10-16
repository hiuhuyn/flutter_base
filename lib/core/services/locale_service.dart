import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService {
  static const String _localeKey = 'selected_locale';

  final SharedPreferences _prefs;

  LocaleService(this._prefs);

  // Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en', ''), // English
    Locale('vi', ''), // Vietnamese
  ];

  // Default locale
  static const Locale defaultLocale = Locale('vi', '');

  // Get saved locale
  Future<Locale> getSavedLocale() async {
    final localeCode = _prefs.getString(_localeKey);

    if (localeCode != null) {
      return Locale(localeCode);
    }

    return defaultLocale;
  }

  // Save locale
  Future<void> saveLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
  }

  // Get locale from language code
  static Locale getLocaleFromCode(String languageCode) {
    return supportedLocales.firstWhere(
      (locale) => locale.languageCode == languageCode,
      orElse: () => defaultLocale,
    );
  }

  // Get language name
  static String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'vi':
        return 'Tiếng Việt';
      default:
        return 'Tiếng Việt';
    }
  }
}
