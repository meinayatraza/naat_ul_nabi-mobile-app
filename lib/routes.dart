import 'package:get/get.dart';
import 'screens/main_screen.dart';
import 'screens/book_detail_screen.dart';
import 'screens/naat_detail_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/settings_screen.dart';

class Routes {
  static const home = '/';
  static const bookDetail = '/book';
  static const naatDetail = '/naat';
  static const favorites = '/favorites';
  static const settings = '/settings';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.home, page: () => MainScreen()),
    GetPage(name: Routes.bookDetail, page: () => BookDetailScreen()),
    GetPage(name: Routes.naatDetail, page: () => NaatDetailScreen()),
    GetPage(name: Routes.favorites, page: () => FavoritesScreen()),
    GetPage(name: Routes.settings, page: () => SettingsScreen()),
  ];
}
