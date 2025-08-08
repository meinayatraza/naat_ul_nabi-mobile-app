import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart';
import '../routes.dart';
import '../data/data_service.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesController fav = Get.find();

  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: GetBuilder<FavoritesController>(
        builder: (_) {
          final list = _.favorites;
          if (list.isEmpty)
            return const Center(child: Text('No favorites yet'));
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: list.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (ctx, i) {
              final m = list[i];
              return ListTile(
                title: Text(m['title'] ?? ''),
                subtitle: Text(m['bookTitle'] ?? ''),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _.remove(m['id']),
                ),
                onTap: () {
                  // navigate to naat detail (we only stored partial data) — just pass id and try to find full object
                  final bookId = m['bookId'];
                  // attempt to find full naat from data service
                  final data = Get.find<DataService>();
                  final book = data.getBookById(bookId);
                  final naat =
                      book?.naats.firstWhereOrNull((n) => n.id == m['id']);
                  if (naat != null) {
                    Get.toNamed(Routes.naatDetail,
                        arguments: naat.copyWith(
                            bookId: book?.id, bookTitle: book?.title));
                  } else {
                    Get.snackbar('Not found', 'Full naat data not available');
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
