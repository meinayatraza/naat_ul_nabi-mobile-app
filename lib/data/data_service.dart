import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/book.dart';
import '../models/naat.dart';

class DataService extends GetxService {
  List<Book> _books = [];

  Future<DataService> init() async {
    await loadFromAssets();
    return this;
  }

  Future<void> loadFromAssets() async {
    final jsonStr = await rootBundle.loadString('assets/naats.json');
    final Map<String, dynamic> map = json.decode(jsonStr);
    _books = (map['books'] as List)
        .map((b) => Book.fromJson(b as Map<String, dynamic>))
        .toList();
  }

  List<Book> get books => _books;

  // search across titles, authors, verses
  List<Naat> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return [];
    final List<Naat> results = [];
    for (var book in _books) {
      for (var naat in book.naats) {
        if (naat.title.toLowerCase().contains(q) ||
            (naat.author ?? '').toLowerCase().contains(q) ||
            naat.verses.any((v) =>
                (v.urdu ?? '').toLowerCase().contains(q) ||
                (v.transliteration ?? '').toLowerCase().contains(q) ||
                (v.translation ?? '').toLowerCase().contains(q))) {
          results.add(naat.copyWith(bookId: book.id, bookTitle: book.title));
        }
      }
    }
    return results;
  }

  Book? getBookById(String id) =>
      _books.firstWhereOrNull((b) => b.id == id); // extension from Get
}
