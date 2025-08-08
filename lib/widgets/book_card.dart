import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback? onTap;
  const BookCard({Key? key, required this.book, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: book.cover != null
            ? Image.asset(book.cover!, width: 56, fit: BoxFit.cover)
            : const SizedBox(width: 56, child: Icon(Icons.book)),
        title: Text(book.title),
        subtitle: Text('${book.naats.length} naats'),
        onTap: onTap,
      ),
    );
  }
}
