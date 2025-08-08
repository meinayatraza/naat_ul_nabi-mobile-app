import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './routes/app_routes.dart';
import '../presentation/screens/main_screen.dart';
import '../presentation/screens/book_detail_screen.dart';
import '../presentation/screens/naat_detail_screen.dart';
import '../presentation/screens/favorites_screen.dart';
import '../presentation/screens/settings_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Naat-ul-Nabi',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.main,
      getPages: [
        GetPage(name: AppRoutes.main, page: () => MainScreen()),
        GetPage(name: AppRoutes.bookDetail, page: () => BookDetailScreen()),
        GetPage(name: AppRoutes.naatDetail, page: () => NaatDetailScreen()),
        GetPage(name: AppRoutes.favorites, page: () => FavoritesScreen()),
        GetPage(name: AppRoutes.settings, page: () => SettingsScreen()),
      ],
    );
  }
}
