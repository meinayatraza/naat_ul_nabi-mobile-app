import 'package:flutter/material.dart';
import '../models/verse.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class VerseCard extends StatelessWidget {
  final Verse verse;
  final double fontSize;
  final VoidCallback? onExplain;
  final VoidCallback? onShare;

  const VerseCard({
    Key? key,
    required this.verse,
    this.fontSize = 18,
    this.onExplain,
    this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (verse.urdu != null)
              Text(verse.urdu!, style: TextStyle(fontSize: fontSize)),
            if (verse.transliteration != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(verse.transliteration!,
                    style: TextStyle(
                        fontSize: fontSize - 2, fontStyle: FontStyle.italic)),
              ),
            if (verse.translation != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(verse.translation!,
                    style: TextStyle(fontSize: fontSize - 4)),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text: verse.urdu ?? verse.translation ?? ''));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Copied')));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    final text =
                        '${verse.urdu ?? ''}\n\n${verse.translation ?? ''}';
                    Share.share(text);
                    if (onShare != null) onShare!();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: onExplain,
                ),
                const Spacer(),
                // you can add favorite per verse if needed
              ],
            )
          ],
        ),
      ),
    );
  }
}
