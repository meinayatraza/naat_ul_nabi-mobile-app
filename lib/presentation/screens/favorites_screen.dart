import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/naat_controller.dart';
import '../widgets/naat_list_item.dart';
import '../widgets/custom_app_bar.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NaatController>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Favorites'),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return Center(child: Text('No favorites yet'));
        }
        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final naat = controller.favorites[index];
            return NaatListItem(naat: naat, bookId: naat.bookId);
          },
        );
      }),
    );
  }
}
