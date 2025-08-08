import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final _box = GetStorage();
  bool isDark = false;
  double fontSize = 18.0;
  String language = 'urdu'; // or transliteration/translation

  @override
  void onInit() {
    super.onInit();
    isDark = _box.read('isDark') ?? false;
    fontSize = _box.read('fontSize') ?? 18.0;
    language = _box.read('language') ?? 'urdu';
  }

  void toggleDark() {
    isDark = !isDark;
    _box.write('isDark', isDark);
    update();
  }

  void setFontSize(double size) {
    fontSize = size;
    _box.write('fontSize', fontSize);
    update();
  }

  void setLanguage(String lang) {
    language = lang;
    _box.write('language', language);
    update();
  }
}
