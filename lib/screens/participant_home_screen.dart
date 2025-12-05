import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../utils/translations.dart';
import '../widgets/language_switcher.dart';

class ParticipantHomeScreen extends StatelessWidget {
  const ParticipantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              Translations.t('homeSession', languageProvider.languageCode),
            ),
            elevation: 0,
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: LanguageSwitcher(showLabel: false)),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Comment souhaitez-vous continuer ?',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  // Scanner QR Code Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/qr_scanner');
                    },
                    icon: const Icon(Icons.qr_code_scanner),
                    label: Text(
                      Translations.t('scanQR', languageProvider.languageCode),
                    ),
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
                  Text(
                    Translations.t('or', languageProvider.languageCode),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  // Enter Code Button
                  ElevatedButton.icon(
                    onPressed: () {
                      _showCodeDialog(context, languageProvider.languageCode);
                    },
                    icon: const Icon(Icons.vpn_key),
                    label: Text(
                      Translations.t(
                        'enterCode',
                        languageProvider.languageCode,
                      ),
                    ),
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
      },
    );
  }

  void _showCodeDialog(BuildContext context, String languageCode) {
    final codeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.t('enterCode', languageCode)),
        content: TextField(
          controller: codeController,
          decoration: InputDecoration(
            hintText: Translations.t('enterCode', languageCode),
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
              // TODO: Traiter le code
              Navigator.pop(context);
            },
            child: Text(Translations.t('validate', languageCode)),
          ),
        ],
      ),
    );
  }
}
