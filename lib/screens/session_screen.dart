import 'package:flutter/material.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  bool _showMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Session Active'),
        elevation: 0,
      ),
      body: _showMap ? _buildMapView() : _buildBeaconsView(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                setState(() {
                  _showMap = true;
                });
              },
              tooltip: 'Voir la carte',
            ),
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                setState(() {
                  _showMap = false;
                });
              },
              tooltip: 'Voir les balises',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBeaconsView() {
    return ListView.builder(
      itemCount: 5, // TODO: Remplacer par les vraies balises
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: const Icon(Icons.location_on, color: Colors.red),
          title: Text('Balise ${index + 1}'),
          trailing: ElevatedButton(
            onPressed: () {
              // TODO: Scanner la balise
            },
            child: const Text('Scanner'),
          ),
        ),
      ),
    );
  }

  Widget _buildMapView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.map, size: 60, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Carte des balises',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'La carte sera affichée ici',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
