// data/repositories/naat_repository_impl.dart
import '../../domain/entities/naat.dart';
import '../../domain/repositories/naat_repository.dart';
import '../datasources/local/json_data_source.dart';
import '../datasources/local/shared_preferences_helper.dart';

class NaatRepositoryImpl implements NaatRepository {
  final JsonDataSource _localDataSource;

  NaatRepositoryImpl(this._localDataSource);

  @override
  Future<List<Naat>> getNaatsByBookId(String bookId) async {
    try {
      final naatModels = await _localDataSource.getNaatsByBookId(bookId);
      return naatModels;
    } catch (e) {
      throw DataException('Failed to load naats: $e');
    }
  }

  @override
  Future<List<Naat>> getNaatsByLetter(String bookId, String letter) async {
    final allNaats = await getNaatsByBookId(bookId);
    return allNaats
        .where((naat) => naat.firstLetter.toUpperCase() == letter.toUpperCase())
        .toList();
  }

  @override
  Future<Naat?> getNaatById(String id) async {
    try {
      return await _localDataSource.getNaatById(id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Naat>> searchNaats(String query) async {
    try {
      // This is a simplified search - in a real app, you might want to search across all naats
      // For now, we'll implement a basic search that looks through all available naats
      final allBooks = await _localDataSource.getBooks();
      List<Naat> allNaats = [];

      for (final book in allBooks) {
        final bookNaats = await _localDataSource.getNaatsByBookId(book.id);
        allNaats.addAll(bookNaats);
      }

      final lowerQuery = query.toLowerCase();
      return allNaats.where((naat) {
        return naat.title.toLowerCase().contains(lowerQuery) ||
            naat.titleUrdu.contains(query) ||
            naat.keywords
                .any((keyword) => keyword.toLowerCase().contains(lowerQuery)) ||
            naat.verses.any((verse) =>
                verse.textUrdu.contains(query) ||
                (verse.textTranslation?.toLowerCase().contains(lowerQuery) ??
                    false));
      }).toList();
    } catch (e) {
      throw DataException('Failed to search naats: $e');
    }
  }

  @override
  Future<List<Naat>> getFavoriteNaats() async {
    try {
      final favoriteIds = SharedPreferencesHelper.getFavorites();
      List<Naat> favoriteNaats = [];

      for (final id in favoriteIds) {
        final naat = await _localDataSource.getNaatById(id);
        if (naat != null) {
          favoriteNaats.add(naat);
        }
      }

      return favoriteNaats;
    } catch (e) {
      throw DataException('Failed to load favorite naats: $e');
    }
  }

  @override
  Future<void> toggleFavorite(String naatId) async {
    if (SharedPreferencesHelper.isFavorite(naatId)) {
      await SharedPreferencesHelper.removeFavorite(naatId);
    } else {
      await SharedPreferencesHelper.addFavorite(naatId);
    }
  }

  @override
  Future<bool> isFavorite(String naatId) async {
    return SharedPreferencesHelper.isFavorite(naatId);
  }
}
