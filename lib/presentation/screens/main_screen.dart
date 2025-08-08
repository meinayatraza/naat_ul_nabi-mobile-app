import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_controller.dart';
import '../widgets/book_card.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/search_bar.dart' as custom_search_bar;

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookController());

    return Scaffold(
      appBar: CustomAppBar(title: 'Naat-ul-Nabi'),
      body: Column(
        children: [
          custom_search_bar.SearchBar(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: controller.books.length,
                itemBuilder: (context, index) {
                  final book = controller.books[index];
                  return BookCard(book: book);
                },
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {
          if (index == 1) Get.toNamed('/favorites');
          if (index == 2) Get.toNamed('/settings');
        },
      ),
    );
  }
}
