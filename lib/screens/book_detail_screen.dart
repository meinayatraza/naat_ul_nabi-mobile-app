import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/naat_controller.dart';
import '../widgets/alphabet_selector.dart';
import '../widgets/empty_widget.dart';
import '../routes.dart';

class BookDetailScreen extends StatelessWidget {
  final NaatController naatCtrl = Get.find();

  BookDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final book = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Column(
        children: [
          AlphabetSelector(
            onSelected: (l) => naatCtrl.selectLetter(l),
          ),
          Expanded(
            child: GetBuilder<NaatController>(
              builder: (_) {
                final list = _.currentList;
                if (list.isEmpty) {
                  return const EmptyWidget(message: 'No naats for this letter');
                }
                return ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (ctx, i) {
                    final n = list[i];
                    return ListTile(
                      title: Text(n.title),
                      subtitle: Text(n.author ?? ''),
                      onTap: () => Get.toNamed(Routes.naatDetail, arguments: n),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
