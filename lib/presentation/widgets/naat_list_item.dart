import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/naat.dart';

class NaatListItem extends StatelessWidget {
  final Naat naat;
  final int bookId;

  NaatListItem({required this.naat, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(naat.title),
      onTap: () => Get.toNamed('/naat_detail',
          arguments: {'bookId': bookId, 'naatId': naat.id}),
    );
  }
}
