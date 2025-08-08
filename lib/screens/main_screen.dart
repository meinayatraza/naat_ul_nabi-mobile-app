import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_controller.dart';
import '../controllers/naat_controller.dart';
import '../widgets/book_card.dart';
import '../widgets/search_bar.dart' as custom_widgets;
import '../widgets/loading_widget.dart';
import '../widgets/empty_widget.dart';
import '../routes.dart';
import '../controllers/favorites_controller.dart';

class MainScreen extends StatelessWidget {
  final BookController bookCtrl = Get.find();
  final NaatController naatCtrl = Get.find();
  final FavoritesController favCtrl = Get.find();

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naat-ul-Nabi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Get.toNamed(Routes.favorites),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(Routes.settings),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: custom_widgets.SearchBar(onSearch: (q) {
              naatCtrl.runSearch(q);
              if (q.trim().isNotEmpty) {
                // show results on a simple bottom sheet
                Get.bottomSheet(
                  Obx(() => _SearchResults()),
                  isScrollControlled: true,
                );
              }
            }),
          ),
        ),
      ),
      body: GetBuilder<BookController>(
        builder: (_) {
          if (_.loading) return const LoadingWidget();
          if (_.books.isEmpty)
            return const EmptyWidget(message: 'No books found');
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: _.books.length,
            itemBuilder: (ctx, i) {
              final book = _.books[i];
              return BookCard(
                book: book,
                onTap: () {
                  Get.find<NaatController>().selectBook(book.id);
                  Get.toNamed(Routes.bookDetail, arguments: book);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  final naatCtrl = Get.find<NaatController>();
  final favCtrl = Get.find<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.7,
      decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Obx(() {
        final results = naatCtrl.searchResults;
        if (results.isEmpty) {
          return const Center(child: Text('No results'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: results.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (ctx, i) {
            final n = results[i];
            return ListTile(
              title: Text(n.title),
              subtitle: Text(n.bookTitle ?? ''),
              trailing: IconButton(
                icon: Icon(favCtrl.isFavorite(n.id)
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  if (favCtrl.isFavorite(n.id)) {
                    favCtrl.remove(n.id);
                  } else {
                    favCtrl.add(n);
                  }
                },
              ),
              onTap: () {
                Get.back(); // close sheet
                Get.toNamed(Routes.naatDetail, arguments: n);
              },
            );
          },
        );
      }),
    );
  }
}
