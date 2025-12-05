import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';

class LanguageSwitcher extends StatefulWidget {
  final bool showLabel;

  const LanguageSwitcher({super.key, this.showLabel = false});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return PopupMenuButton<Language>(
          initialValue: languageProvider.currentLanguage,
          onSelected: (Language language) {
            languageProvider.setLanguage(language);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  languageProvider.currentLanguage.flag,
                  style: const TextStyle(fontSize: 20),
                ),
                if (widget.showLabel) ...[
                  const SizedBox(width: 8),
                  Text(
                    languageProvider.currentLanguage.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, size: 20),
              ],
            ),
          ),
          itemBuilder: (BuildContext context) {
            return Language.values.map((Language language) {
              return PopupMenuItem<Language>(
                value: language,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(language.flag, style: const TextStyle(fontSize: 24)),
                    const SizedBox(width: 12),
                    Text(language.name),
                  ],
                ),
              );
            }).toList();
          },
        );
      },
    );
  }
}
