import 'package:flutter/material.dart';

enum Language {
  french('fr', 'Français', '🇫🇷'),
  english('en', 'English', '🇬🇧'),
  basque('eu', 'Euskera', '🏴');

  final String code;
  final String name;
  final String flag;

  const Language(this.code, this.name, this.flag);

  static Language fromCode(String code) {
    return Language.values.firstWhere(
      (lang) => lang.code == code,
      orElse: () => Language.french,
    );
  }
}

class LanguageProvider extends ChangeNotifier {
  Language _currentLanguage = Language.french;

  Language get currentLanguage => _currentLanguage;

  String get languageCode => _currentLanguage.code;

  void setLanguage(Language language) {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      notifyListeners();
    }
  }
}
