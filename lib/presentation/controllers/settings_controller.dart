import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isDarkTheme = false.obs;
  var fontSize = 16.0.obs;
  var language = 'Urdu'.obs;

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
  }

  void updateFontSize(double size) {
    fontSize.value = size;
  }

  void updateLanguage(String lang) {
    language.value = lang;
  }
}
