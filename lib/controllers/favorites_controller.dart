import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/naat.dart';

class FavoritesController extends GetxController {
  final _box = GetStorage();
  final _key = 'favorites';
  List<Map<String, dynamic>> _favList = [];

  @override
  void onInit() {
    super.onInit();
    _favList = List<Map<String, dynamic>>.from(_box.read(_key) ?? []);
  }

  List<Map<String, dynamic>> get favorites => _favList;

  bool isFavorite(String naatId) => _favList.any((m) => m['id'] == naatId);

  void add(Naat naat) {
    if (!isFavorite(naat.id)) {
      _favList.add(naat.toMapForFav());
      _save();
      update();
    }
  }

  void remove(String naatId) {
    _favList.removeWhere((m) => m['id'] == naatId);
    _save();
    update();
  }

  void _save() => _box.write(_key, _favList);
}
