import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';
import '../widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());

    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => SwitchListTile(
                  title: Text('Dark Theme'),
                  value: controller.isDarkTheme.value,
                  onChanged: (value) => controller.toggleTheme(),
                )),
            Text('Font Size'),
            Obx(() => Slider(
                  value: controller.fontSize.value,
                  min: 12,
                  max: 24,
                  onChanged: (value) => controller.updateFontSize(value),
                )),
            Text('Language'),
            Obx(() => DropdownButton<String>(
                  value: controller.language.value,
                  items: ['Urdu', 'Transliteration', 'Translation']
                      .map((lang) =>
                          DropdownMenuItem(value: lang, child: Text(lang)))
                      .toList(),
                  onChanged: (value) => controller.updateLanguage(value!),
                )),
          ],
        ),
      ),
    );
  }
}
