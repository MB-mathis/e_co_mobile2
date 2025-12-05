import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  late MobileScannerController controller;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Scanner le QR code'),
        elevation: 0,
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            if (barcode.rawValue != null) {
              // Afficher le dialog pour entrer le pseudo
              _showPseudoDialog(context, barcode.rawValue!);
              break;
            }
          }
        },
      ),
    );
  }

  void _showPseudoDialog(BuildContext context, String qrData) {
    final pseudoController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Entrez votre pseudo'),
        content: TextField(
          controller: pseudoController,
          decoration: const InputDecoration(
            hintText: 'Votre pseudo',
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
              // TODO: Traiter l'enregistrement et passer à la session
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed('/session');
            },
            child: const Text('Valider'),
          ),
        ],
      ),
    );
  }
}
