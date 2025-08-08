import '../entities/naat.dart';

class Book {
  final int id;
  final String title;
  final String coverImage;
  final List<Naat> naats;

  Book({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.naats,
  });
}
