import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/naat_controller.dart';
import '../widgets/naat_list_item.dart';
import '../widgets/custom_app_bar.dart';

class BookDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int bookId = Get.arguments['bookId'];
    final controller = Get.put(NaatController());
    controller.fetchNaats(bookId);

    return Scaffold(
      appBar: CustomAppBar(title: 'Book Detail'),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 26,
              itemBuilder: (context, index) {
                final letter = String.fromCharCode('A'.codeUnitAt(0) + index);
                return GestureDetector(
                  onTap: () => controller.filterNaatsByLetter(letter),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(letter, style: TextStyle(fontSize: 18)),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              final filteredNaats = controller.naats
                  .where((naat) =>
                      naat.title.startsWith(controller.selectedLetter.value))
                  .toList();
              return ListView.builder(
                itemCount: filteredNaats.length,
                itemBuilder: (context, index) {
                  final naat = filteredNaats[index];
                  return NaatListItem(naat: naat, bookId: bookId);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
