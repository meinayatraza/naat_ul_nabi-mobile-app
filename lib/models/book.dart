import 'naat.dart';

class Book {
  final String id;
  final String title;
  final String? cover; // asset path
  final List<Naat> naats;

  Book({
    required this.id,
    required this.title,
    this.cover,
    required this.naats,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      title: json['title'] as String,
      cover: json['cover'] as String?,
      naats: (json['naats'] as List)
          .map((n) => Naat.fromJson(n as Map<String, dynamic>))
          .toList(),
    );
  }
}
