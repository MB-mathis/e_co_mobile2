class AppConstants {
  // API Configuration
  static const String apiBaseUrl =
      'https://api.example.com'; // À remplacer par votre URL
  static const Duration apiTimeout = Duration(seconds: 30);

  // App Info
  static const String appName = 'E-CO Mobile';
  static const String appVersion = '1.0.0';

  // Roles
  static const String roleProfessor = 'professor';
  static const String roleParticipant = 'participant';

  // Storage Keys
  static const String storageUserKey = 'user_data';
  static const String storageTokenKey = 'auth_token';
  static const String storageSessionKey = 'current_session';
}
