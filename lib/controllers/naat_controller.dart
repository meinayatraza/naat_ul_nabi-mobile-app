import 'package:get/get.dart';
import '../models/naat.dart';
import '../data/data_service.dart';

class NaatController extends GetxController {
  final DataService _dataService = Get.find();

  // current selections
  String? selectedBookId;
  String selectedLetter = 'A';
  List<Naat> currentList = [];

  // search results
  List<Naat> searchResults = [];

  void selectBook(String bookId) {
    selectedBookId = bookId;
    selectedLetter = 'A';
    _filter();
    update();
  }

  void selectLetter(String letter) {
    selectedLetter = letter;
    _filter();
    update();
  }

  void _filter() {
    if (selectedBookId == null) {
      currentList = [];
      return;
    }
    final book = _dataService.getBookById(selectedBookId!);
    if (book == null) {
      currentList = [];
      return;
    }
    currentList = book.naats
        .where((n) => n.title.toUpperCase().startsWith(selectedLetter))
        .map((n) => n.copyWith(bookId: book.id, bookTitle: book.title))
        .toList();
  }

  void runSearch(String q) {
    searchResults = _dataService.search(q);
    update();
  }
}
