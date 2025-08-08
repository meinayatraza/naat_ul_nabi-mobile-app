import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String message;
  const EmptyWidget({Key? key, this.message = 'Nothing here'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(message,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)));
  }
}
