import 'dart:convert';
import 'naat_model.dart';

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

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      coverImage: json['coverImage'],
      naats: (json['naats'] as List).map((i) => Naat.fromJson(i)).toList(),
    );
  }
}
