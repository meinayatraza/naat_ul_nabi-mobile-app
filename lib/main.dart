import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'data/data_service.dart';
import 'controllers/settings_controller.dart';
import 'controllers/favorites_controller.dart';
import 'controllers/book_controller.dart';
import 'controllers/naat_controller.dart';

/// Public initializer that ensures all services/controllers are ready.
/// Tests can call `await initApp();` before pumping widgets.
Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize persistent storage
  await GetStorage.init();

  // initialize DataService and load assets (DataService.init() should return Future<DataService>)
  await Get.putAsync<DataService>(() => DataService().init());

  // register controllers AFTER DataService is available
  // (these controllers read storage / dataService on init)
  Get.put(SettingsController());
  Get.put(FavoritesController());
  Get.put(BookController());
  Get.put(NaatController());
}

Future<void> main() async {
  await initApp();
  runApp(App());
}
