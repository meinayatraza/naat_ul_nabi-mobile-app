import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';
import 'themes.dart';
import 'controllers/settings_controller.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SettingsController must already be registered by initApp()
    return GetBuilder<SettingsController>(
      builder: (s) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Naat-ul-Nabi',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: s.isDark ? ThemeMode.dark : ThemeMode.light,
          initialRoute: Routes.home,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
