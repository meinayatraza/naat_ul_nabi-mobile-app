import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/verse.dart';
import '../../domain/entities/naat.dart';
import '../controllers/naat_controller.dart';

class VerseCard extends StatelessWidget {
  final Verse verse;
  final Naat naat;

  VerseCard({required this.verse, required this.naat});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NaatController>();

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(verse.text, style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () => Get.snackbar('Shared', 'Verse shared'),
                ),
                Obx(() => IconButton(
                      icon: Icon(controller.favorites.contains(naat)
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () => controller.toggleFavorite(naat),
                    )),
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () => Get.bottomSheet(
                    Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.white,
                      child: Text(verse.explanation),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () => Get.snackbar('Copied', 'Verse copied'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
