import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/naat_controller.dart';
import '../widgets/verse_card.dart';
import '../widgets/custom_app_bar.dart';

class NaatDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int bookId = Get.arguments['bookId'];
    final int naatId = Get.arguments['naatId'];
    final controller = Get.find<NaatController>();

    return FutureBuilder(
      future: controller.fetchNaatDetail(bookId, naatId),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        final naat = snapshot.data!;
        return Scaffold(
          appBar: CustomAppBar(title: naat.title),
          body: ListView.builder(
            itemCount: naat.verses.length,
            itemBuilder: (context, index) {
              final verse = naat.verses[index];
              return VerseCard(verse: verse, naat: naat);
            },
          ),
        );
      },
    );
  }
}
