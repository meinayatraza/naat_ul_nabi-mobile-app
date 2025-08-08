import 'package:get/get.dart';
import '../../domain/usecases/get_books.dart';
import '../../domain/entities/book.dart';

class BookController extends GetxController {
  var books = <Book>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  Future<void> fetchBooks() async {
    isLoading.value = true;
    final getBooks = GetBooks();
    books.value = await getBooks();
    isLoading.value = false;
  }
}
