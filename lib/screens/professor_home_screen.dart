import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../utils/translations.dart';
import '../widgets/language_switcher.dart';

class ProfessorHomeScreen extends StatefulWidget {
  const ProfessorHomeScreen({super.key});

  @override
  State<ProfessorHomeScreen> createState() => _ProfessorHomeScreenState();
}

class _ProfessorHomeScreenState extends State<ProfessorHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        final lang = languageProvider.languageCode;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Accueil Professeur'),
            elevation: 0,
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: LanguageSwitcher(showLabel: false)),
              ),
            ],
          ),
          body: _selectedIndex == 0
              ? _buildSessionsView(lang)
              : _buildCoursesView(lang),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.assignment),
                label: Translations.t('sessions', lang),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.map),
                label: Translations.t('courses', lang),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSessionsView(String lang) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.assignment, size: 60, color: Colors.blue),
          const SizedBox(height: 20),
          Text(
            Translations.t('sessions', lang),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Créer une nouvelle session
            },
            icon: const Icon(Icons.add),
            label: Text(Translations.t('createSession', lang)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesView(String lang) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.map, size: 60, color: Colors.green),
          const SizedBox(height: 20),
          Text(
            Translations.t('courses', lang),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            Translations.t('noCourses', lang),
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
