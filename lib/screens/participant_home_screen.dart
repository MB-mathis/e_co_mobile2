import 'package:flutter/material.dart';

class ParticipantHomeScreen extends StatelessWidget {
  const ParticipantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Accueil Participant'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Comment souhaitez-vous continuer ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Scanner QR Code Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/qr_scanner');
                },
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text('Scanner le QR code'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('ou', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              // Enter Code Button
              ElevatedButton.icon(
                onPressed: () {
                  _showCodeDialog(context);
                },
                icon: const Icon(Icons.vpn_key),
                label: const Text('Entrer le code de session'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCodeDialog(BuildContext context) {
    final codeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Entrer le code de session'),
        content: TextField(
          controller: codeController,
          decoration: const InputDecoration(
            hintText: 'Code de session',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Traiter le code
              Navigator.pop(context);
            },
            child: const Text('Valider'),
          ),
        ],
      ),
    );
  }
}
