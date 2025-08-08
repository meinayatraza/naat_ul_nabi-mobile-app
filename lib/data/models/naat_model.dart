import 'verse_model.dart';

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

  factory Naat.fromJson(Map<String, dynamic> json) {
    return Naat(
      id: json['id'],
      title: json['title'],
      bookId: json['bookId'],
      verses: (json['verses'] as List).map((i) => Verse.fromJson(i)).toList(),
    );
  }
}
