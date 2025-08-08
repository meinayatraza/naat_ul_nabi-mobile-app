// presentation/providers/settings_provider.dart
import 'package:flutter/material.dart';
import '../../data/datasources/local/shared_preferences_helper.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  String _selectedLanguage = 'en';
  double _fontSize = 16.0;

  ThemeMode get themeMode => _themeMode;
  String get selectedLanguage => _selectedLanguage;
  double get fontSize => _fontSize;

  SettingsProvider() {
    _loadSettings();
  }

  void _loadSettings() {
    final themeModeString = SharedPreferencesHelper.getThemeMode();
    _themeMode = ThemeMode.values.firstWhere(
      (mode) => mode.name == themeModeString,
      orElse: () => ThemeMode.system,
    );
    _selectedLanguage = SharedPreferencesHelper.getLanguage();
    _fontSize = SharedPreferencesHelper.getFontSize();
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await SharedPreferencesHelper.setThemeMode(mode.name);
    notifyListeners();
  }

  Future<void> setLanguage(String language) async {
    _selectedLanguage = language;
    await SharedPreferencesHelper.setLanguage(language);
    notifyListeners();
  }

  Future<void> setFontSize(double size) async {
    _fontSize = size;
    await SharedPreferencesHelper.setFontSize(size);
    notifyListeners();
  }
}
