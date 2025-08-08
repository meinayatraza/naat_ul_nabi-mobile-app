import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset('assets/images/book_covers/${book.coverImage}',
            width: 50),
        title: Text(book.title),
        onTap: () =>
            Get.toNamed('/book_detail', arguments: {'bookId': book.id}),
      ),
    );
  }
}
