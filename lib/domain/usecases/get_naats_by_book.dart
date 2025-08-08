import 'package:get/get.dart';
import '../../data/repositories/data_repository.dart';
import '../../data/models/book_model.dart' as model_book;
import '../../data/models/naat_model.dart' as model_naat;
import '../entities/naat.dart';
import '../entities/verse.dart';

class GetNaatsByBook {
  final DataRepository repository = Get.find<DataRepository>();

  Future<List<Naat>> call(int bookId) async {
    final modelBooks = await repository.getBooks();
    final modelBook = modelBooks.firstWhere((book) => book.id == bookId);
    return modelBook.naats.map((modelNaat) => _mapToEntity(modelNaat)).toList();
  }

  Naat _mapToEntity(model_naat.Naat modelNaat) {
    return Naat(
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
    );
  }
}
