import 'package:flutter/material.dart';
import '../services/translation_service.dart';
import '../providers/language_provider.dart';

class DynamicTranslationProvider extends ChangeNotifier {
  final TranslationService _translationService = TranslationService();
  final Map<String, String> _translationCache = {};
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initialize(String? apiKey) async {
    await _translationService.initialize(apiKey);
    _isInitialized = true;
  }

  Future<String> translate(String text, Language language) async {
    // Utiliser la langue comme clé de cache
    final cacheKey = '$text:${language.code}';

    if (_translationCache.containsKey(cacheKey)) {
      return _translationCache[cacheKey]!;
    }

    final translated = await _translationService.translate(text, language.code);
    _translationCache[cacheKey] = translated;
    notifyListeners();

    return translated;
  }

  void clearCache() {
    _translationCache.clear();
    _translationService.clearCache();
  }
}
