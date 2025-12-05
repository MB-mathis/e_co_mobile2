import 'package:flutter/material.dart';

class ProfessorHomeScreen extends StatefulWidget {
  const ProfessorHomeScreen({super.key});

  @override
  State<ProfessorHomeScreen> createState() => _ProfessorHomeScreenState();
}

class _ProfessorHomeScreenState extends State<ProfessorHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Accueil Professeur'),
        elevation: 0,
      ),
      body: _selectedIndex == 0 ? _buildSessionsView() : _buildCoursesView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Sessions',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Parcours'),
        ],
      ),
    );
  }

  Widget _buildSessionsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.assignment, size: 60, color: Colors.blue),
          const SizedBox(height: 20),
          const Text(
            'Sessions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Créer une nouvelle session
            },
            icon: const Icon(Icons.add),
            label: const Text('Créer une session'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.map, size: 60, color: Colors.green),
          const SizedBox(height: 20),
          const Text(
            'Parcours',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Aucun parcours disponible',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
