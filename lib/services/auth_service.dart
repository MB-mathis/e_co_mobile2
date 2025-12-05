import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'dart:convert';

class AuthService {
  static const String _userKey = 'user_data';
  static const String _tokenKey = 'auth_token';

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> login(String email, String password) async {
    try {
      // TODO: Appel API pour l'authentification
      // Pour l'instant, on simule une connexion réussie
      final user = User(
        id: '1',
        email: email,
        fullName: 'Test User',
        role: 'professor',
        token: 'dummy_token_123',
      );

      await saveUser(user);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveUser(User user) async {
    await _prefs.setString(_userKey, jsonEncode(user.toJson()));
    if (user.token != null) {
      await _prefs.setString(_tokenKey, user.token!);
    }
  }

  User? getCurrentUser() {
    final userJson = _prefs.getString(_userKey);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  Future<void> logout() async {
    await _prefs.remove(_userKey);
    await _prefs.remove(_tokenKey);
  }

  bool isLoggedIn() {
    return _prefs.containsKey(_userKey);
  }
}
