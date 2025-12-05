import 'package:http/http.dart' as http;
import 'dart:convert';

class TranslationService {
  static final TranslationService _instance = TranslationService._internal();
  final String _apiUrl = 'https://libretranslate.de/translate';
  final Map<String, Map<String, String>> _cache = {};

  TranslationService._internal();

  factory TranslationService() {
    return _instance;
  }

  Future<void> initialize(String? apiKey) async {
    // LibreTranslate n'a pas besoin de clé API (version publique gratuite)
  }

  Future<String> translate(String text, String targetLanguage) async {
    // Vérifier le cache
    final cacheKey = '$text:$targetLanguage';
    if (_cache[targetLanguage] != null &&
        _cache[targetLanguage]![cacheKey] != null) {
      return _cache[targetLanguage]![cacheKey]!;
    }

    try {
      final response = await http
          .post(
            Uri.parse(_apiUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'q': text,
              'source': 'fr',
              'target': _getLibreTranslateLanguageCode(targetLanguage),
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final translatedText = data['translatedText'];

        // Mettre en cache
        _cache.putIfAbsent(targetLanguage, () => {});
        _cache[targetLanguage]![cacheKey] = translatedText;

        return translatedText;
      } else {
        print('Erreur LibreTranslate: ${response.statusCode}');
        return text;
      }
    } catch (e) {
      print('Erreur de traduction: $e');
      return text;
    }
  }

  String _getLibreTranslateLanguageCode(String languageCode) {
    // LibreTranslate utilise des codes ISO 639-1
    switch (languageCode) {
      case 'fr':
        return 'fr';
      case 'en':
        return 'en';
      case 'eu':
        return 'eu';
      default:
        return 'en';
    }
  }

  void clearCache() {
    _cache.clear();
  }
}
