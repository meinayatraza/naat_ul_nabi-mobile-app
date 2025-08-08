import 'package:get/get.dart';
import '../../data/repositories/data_repository.dart';
import '../../data/models/book_model.dart' as model_book;
import '../../data/models/naat_model.dart' as model_naat;
import '../entities/naat.dart';
import '../entities/verse.dart';

class GetNaatDetail {
  final DataRepository repository = Get.find<DataRepository>();

  Future<Naat> call(int bookId, int naatId) async {
    final modelBooks = await repository.getBooks();
    final modelBook = modelBooks.firstWhere((book) => book.id == bookId);
    final modelNaat = modelBook.naats.firstWhere((naat) => naat.id == naatId);
    return _mapToEntity(modelNaat);
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
