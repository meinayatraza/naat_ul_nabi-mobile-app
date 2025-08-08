import 'package:get/get.dart';
import '../data/data_service.dart';
import '../models/book.dart';

class BookController extends GetxController {
  final DataService _dataService = Get.find();
  List<Book> books = [];
  bool loading = true;

  @override
  void onInit() {
    super.onInit();
    loadBooks();
  }

  void loadBooks() async {
    loading = true;
    update();
    await _dataService.loadFromAssets(); // reload if needed
    books = _dataService.books;
    loading = false;
    update();
  }
}
