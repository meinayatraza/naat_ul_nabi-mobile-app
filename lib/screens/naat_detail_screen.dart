import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/naat.dart';
import '../widgets/verse_card.dart';
import '../widgets/explanation_dialog.dart';
import '../controllers/favorites_controller.dart';
import '../controllers/settings_controller.dart';

class NaatDetailScreen extends StatelessWidget {
  NaatDetailScreen({Key? key}) : super(key: key);

  final FavoritesController favs = Get.find();
  final SettingsController settings = Get.find();

  @override
  Widget build(BuildContext context) {
    final Naat naat = Get.arguments as Naat;

    return Scaffold(
      appBar: AppBar(
        title: Text(naat.title),
        actions: [
          Obx(() {
            final isFav = favs.isFavorite(naat.id);
            return IconButton(
              icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                if (isFav) {
                  favs.remove(naat.id);
                } else {
                  favs.add(naat);
                }
              },
            );
          })
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: naat.verses.length,
        itemBuilder: (ctx, i) {
          final v = naat.verses[i];
          return VerseCard(
            verse: v,
            fontSize: settings.fontSize,
            onExplain: () {
              showDialog(
                context: context,
                builder: (_) => ExplanationDialog(
                    explanation: v.explanation ?? 'No explanation'),
              );
            },
            onShare: () {
              // TODO: implement share using share_plus
            },
          );
        },
      ),
    );
  }
}
