import '../entities/verse.dart';

class Naat {
  final int id;
  final String title;
  final int bookId;
  final List<Verse> verses;

  Naat({
    required this.id,
    required this.title,
    required this.bookId,
    required this.verses,
  });
}
