import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/language_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/role_selection_screen.dart';
import 'screens/professor_login_screen.dart';
import 'screens/professor_home_screen.dart';
import 'screens/participant_home_screen.dart';
import 'screens/qr_scanner_screen.dart';
import 'screens/session_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MaterialApp(
        title: 'E-CO Mobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        routes: {
          '/role_selection': (context) => const RoleSelectionScreen(),
          '/professor_login': (context) => const ProfessorLoginScreen(),
          '/professor_home': (context) => const ProfessorHomeScreen(),
          '/participant_home': (context) => const ParticipantHomeScreen(),
          '/qr_scanner': (context) => const QRScannerScreen(),
          '/session': (context) => const SessionScreen(),
        },
      ),
    );
  }
}
