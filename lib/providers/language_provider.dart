import 'package:flutter/material.dart';

enum Language {
  french('fr', 'Français', 'assets/flags/france.svg'),
  english('en', 'English', 'assets/flags/uk.svg'),
  basque('eu', 'Euskera', 'assets/flags/basque.svg');

  final String code;
  final String name;
  final String flagAsset;

  const Language(this.code, this.name, this.flagAsset);

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
