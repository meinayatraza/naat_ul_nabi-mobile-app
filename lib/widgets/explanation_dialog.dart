import 'package:flutter/material.dart';

class ExplanationDialog extends StatelessWidget {
  final String explanation;
  const ExplanationDialog({Key? key, required this.explanation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Explanation'),
      content: SingleChildScrollView(child: Text(explanation)),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close')),
      ],
    );
  }
}
