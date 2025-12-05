import '../services/translation_service.dart';

class Translations {
  // Traductions de base en français
  static const Map<String, String> frenchTranslations = {
    'appTitle': 'E-CO Mobile',
    'selectRole': 'Sélectionnez votre rôle',
    'professor': 'Professeur',
    'participant': 'Participant',
    'login': 'Connexion',
    'email': 'Email',
    'password': 'Mot de passe',
    'loginError': 'Erreur de connexion',
    'sessions': 'Sessions',
    'courses': 'Parcours',
    'createSession': 'Créer une session',
    'noCourses': 'Aucun parcours disponible',
    'scanQR': 'Scanner le QR code',
    'enterCode': 'Entrer le code de session',
    'or': 'ou',
    'enterPseudo': 'Entrez votre pseudo',
    'validate': 'Valider',
    'cancel': 'Annuler',
    'homeSession': 'Accueil Participant',
    'activeSession': 'Session Active',
    'beacons': 'Balises',
    'map': 'Carte',
    'courseOrientation': 'Course d\'orientation',
    'scanBeacon': 'Scanner',
    'beaconList': 'Liste des balises',
    'mapBeacons': 'Carte des balises',
    'language': 'Langue',
    'selectLanguage': 'Sélectionner la langue',
  };

  static const Map<String, Map<String, String>> translations = {
    'fr': frenchTranslations,
    'en': {
      'appTitle': 'E-CO Mobile',
      'selectRole': 'Select your role',
      'professor': 'Teacher',
      'participant': 'Participant',
      'login': 'Login',
      'email': 'Email',
      'password': 'Password',
      'loginError': 'Login error',
      'sessions': 'Sessions',
      'courses': 'Courses',
      'createSession': 'Create a session',
      'noCourses': 'No courses available',
      'scanQR': 'Scan QR code',
      'enterCode': 'Enter session code',
      'or': 'or',
      'enterPseudo': 'Enter your pseudo',
      'validate': 'Validate',
      'cancel': 'Cancel',
      'homeSession': 'Participant Home',
      'activeSession': 'Active Session',
      'beacons': 'Beacons',
      'map': 'Map',
      'courseOrientation': 'Orienteering Course',
      'scanBeacon': 'Scan',
      'beaconList': 'Beacon List',
      'mapBeacons': 'Beacon Map',
      'language': 'Language',
      'selectLanguage': 'Select language',
    },
    'eu': {
      'appTitle': 'E-CO Mobile',
      'selectRole': 'Aukeratu zure rola',
      'professor': 'Irakaslea',
      'participant': 'Partaidea',
      'login': 'Sartu',
      'email': 'Posta elektronikoa',
      'password': 'Pasahitza',
      'loginError': 'Sarrerako errorea',
      'sessions': 'Saioak',
      'courses': 'Ibilbideak',
      'createSession': 'Saioa sortu',
      'noCourses': 'Ez dago ibilbiderik',
      'scanQR': 'QR kodea eskaneatu',
      'enterCode': 'Saioen kodea sartu',
      'or': 'edo',
      'enterPseudo': 'Zure pseudoa sartu',
      'validate': 'Balidatu',
      'cancel': 'Utzi',
      'homeSession': 'Partaidea Hasiera',
      'activeSession': 'Saioa Aktibo',
      'beacons': 'Babesleak',
      'map': 'Mapa',
      'courseOrientation': 'Orientazio Ibilbidea',
      'scanBeacon': 'Eskaneatu',
      'beaconList': 'Babesleen zerrenda',
      'mapBeacons': 'Babesleen mapa',
      'language': 'Hizkuntza',
      'selectLanguage': 'Hizkuntza hautatu',
    },
  };

  static String t(String key, String languageCode) {
    return translations[languageCode]?[key] ?? translations['fr']?[key] ?? key;
  }

  /// Traduit un texte personnalisé avec LibreTranslate vers la langue cible
  static Future<String> translateCustomText(
    String text,
    String targetLanguage,
    TranslationService? translationService,
  ) async {
    if (targetLanguage == 'fr') {
      return text; // Le texte est déjà en français
    }

    if (translationService == null) {
      return text; // Service non initialisé
    }

    return await translationService.translate(text, targetLanguage);
  }
}
