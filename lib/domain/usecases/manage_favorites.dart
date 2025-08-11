// domain/usecases/manage_favorites.dart
import '../entities/naat.dart';
import '../repositories/naat_repository.dart';

class ManageFavorites {
  final NaatRepository repository;

  ManageFavorites(this.repository);

  Future<List<Naat>> getFavoriteNaats() async {
    return await repository.getFavoriteNaats();
  }

  Future<void> toggleFavorite(String naatId) async {
    return await repository.toggleFavorite(naatId);
  }

  Future<bool> isFavorite(String naatId) async {
    return await repository.isFavorite(naatId);
  }
}