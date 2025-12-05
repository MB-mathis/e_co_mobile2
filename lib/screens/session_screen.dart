import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../utils/translations.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  bool _showMap = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        final lang = languageProvider.languageCode;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(Translations.t('activeSession', lang)),
            elevation: 0,
          ),
          body: _showMap ? _buildMapView(lang) : _buildBeaconsView(lang),
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
                  tooltip: Translations.t('mapBeacons', lang),
                ),
                IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    setState(() {
                      _showMap = false;
                    });
                  },
                  tooltip: Translations.t('beaconList', lang),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBeaconsView(String lang) {
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
            child: Text(Translations.t('scanBeacon', lang)),
          ),
        ),
      ),
    );
  }

  Widget _buildMapView(String lang) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.map, size: 60, color: Colors.green),
          const SizedBox(height: 20),
          Text(
            Translations.t('mapBeacons', lang),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'La carte sera affichée ici',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
