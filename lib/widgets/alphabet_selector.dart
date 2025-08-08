import 'package:flutter/material.dart';

class AlphabetSelector extends StatefulWidget {
  final void Function(String) onSelected;
  const AlphabetSelector({Key? key, required this.onSelected})
      : super(key: key);

  @override
  State<AlphabetSelector> createState() => _AlphabetSelectorState();
}

class _AlphabetSelectorState extends State<AlphabetSelector> {
  final letters = List<String>.generate(26, (i) => String.fromCharCode(65 + i));
  String selected = 'A';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: letters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (ctx, i) {
          final l = letters[i];
          final active = l == selected;
          return GestureDetector(
            onTap: () {
              setState(() => selected = l);
              widget.onSelected(l);
            },
            child: Container(
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Text(l,
                  style: TextStyle(color: active ? Colors.white : null)),
            ),
          );
        },
      ),
    );
  }
}
