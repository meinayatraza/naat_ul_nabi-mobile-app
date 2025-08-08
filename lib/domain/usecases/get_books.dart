import 'package:get/get.dart';
import '../../data/repositories/data_repository.dart';
import '../../data/models/book_model.dart' as model;
import '../entities/book.dart';
import '../entities/naat.dart';
import '../entities/verse.dart';

class GetBooks {
  final DataRepository repository = Get.find<DataRepository>();

  Future<List<Book>> call() async {
    final modelBooks = await repository.getBooks();
    return modelBooks.map((modelBook) => _mapToEntity(modelBook)).toList();
  }

  Book _mapToEntity(model.Book modelBook) {
    return Book(
      id: modelBook.id,
      title: modelBook.title,
      coverImage: modelBook.coverImage,
      naats: modelBook.naats
          .map((modelNaat) => Naat(
                id: modelNaat.id,
                title: modelNaat.title,
                bookId: modelNaat.bookId,
                verses: modelNaat.verses
                    .map((modelVerse) => Verse(
                          id: modelVerse.id,
                          text: modelVerse.text,
                          explanation: modelVerse.explanation,
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
