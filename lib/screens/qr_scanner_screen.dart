import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../utils/translations.dart';

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
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        final lang = languageProvider.languageCode;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(Translations.t('scanQR', lang)),
            elevation: 0,
          ),
          body: MobileScanner(
            controller: controller,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  // Afficher le dialog pour entrer le pseudo
                  _showPseudoDialog(context, barcode.rawValue!, lang);
                  break;
                }
              }
            },
          ),
        );
      },
    );
  }

  void _showPseudoDialog(
    BuildContext context,
    String qrData,
    String languageCode,
  ) {
    final pseudoController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.t('enterPseudo', languageCode)),
        content: TextField(
          controller: pseudoController,
          decoration: InputDecoration(
            hintText: Translations.t('enterPseudo', languageCode),
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(Translations.t('cancel', languageCode)),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Traiter l'enregistrement et passer à la session
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed('/session');
            },
            child: Text(Translations.t('validate', languageCode)),
          ),
        ],
      ),
    );
  }
}
