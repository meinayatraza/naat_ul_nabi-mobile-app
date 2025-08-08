import 'package:get/get.dart';
import '../../domain/usecases/get_naats_by_book.dart';
import '../../domain/usecases/get_naat_detail.dart';
import '../../domain/entities/naat.dart';

class NaatController extends GetxController {
  var naats = <Naat>[].obs;
  var favorites = <Naat>[].obs;
  var selectedLetter = 'A'.obs;

  Future<void> fetchNaats(int bookId) async {
    final getNaats = GetNaatsByBook();
    naats.value = await getNaats(bookId);
  }

  Future<Naat> fetchNaatDetail(int bookId, int naatId) async {
    final getNaat = GetNaatDetail();
    return await getNaat(bookId, naatId);
  }

  void filterNaatsByLetter(String letter) {
    selectedLetter.value = letter;
  }

  void toggleFavorite(Naat naat) {
    if (favorites.contains(naat)) {
      favorites.remove(naat);
    } else {
      favorites.add(naat);
    }
  }
}
