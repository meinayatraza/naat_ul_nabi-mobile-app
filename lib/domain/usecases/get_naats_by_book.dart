// domain/usecases/get_naats_by_book.dart
import '../entities/naat.dart';
import '../repositories/naat_repository.dart';

class GetNaatsByBook {
  final NaatRepository repository;

  GetNaatsByBook(this.repository);

  Future<List<Naat>> call(String bookId) async {
    return await repository.getNaatsByBookId(bookId);
  }
}
