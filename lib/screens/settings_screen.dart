import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController settings = Get.find();

  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: GetBuilder<SettingsController>(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SwitchListTile(
                title: const Text('Dark theme'),
                value: _.isDark,
                onChanged: (_) => settings.toggleDark(),
              ),
              ListTile(
                title: const Text('Font size'),
                subtitle: Slider(
                  min: 12,
                  max: 30,
                  value: _.fontSize,
                  onChanged: (v) => settings.setFontSize(v),
                ),
                trailing: Text(_.fontSize.toStringAsFixed(0)),
              ),
              ListTile(
                title: const Text('Language'),
                subtitle: DropdownButton<String>(
                  value: _.language,
                  onChanged: (v) => settings.setLanguage(v!),
                  items: const [
                    DropdownMenuItem(value: 'urdu', child: Text('اردو')),
                    DropdownMenuItem(
                        value: 'transliteration',
                        child: Text('Transliteration')),
                    DropdownMenuItem(
                        value: 'translation', child: Text('Translation')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
