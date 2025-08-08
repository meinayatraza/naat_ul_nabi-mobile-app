import 'verse.dart';

class Naat {
  final String id;
  final String title;
  final String? author;
  final List<Verse> verses;
  // runtime-only:
  final String? bookId;
  final String? bookTitle;

  Naat({
    required this.id,
    required this.title,
    this.author,
    required this.verses,
    this.bookId,
    this.bookTitle,
  });

  Naat copyWith({String? bookId, String? bookTitle}) {
    return Naat(
      id: id,
      title: title,
      author: author,
      verses: verses,
      bookId: bookId ?? this.bookId,
      bookTitle: bookTitle ?? this.bookTitle,
    );
  }

  factory Naat.fromJson(Map<String, dynamic> json) {
    return Naat(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String?,
      verses: (json['verses'] as List)
          .map((v) => Verse.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMapForFav() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'bookId': bookId,
      'bookTitle': bookTitle,
    };
  }
}
