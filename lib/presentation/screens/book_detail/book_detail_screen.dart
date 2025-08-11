// presentation/screens/books/books_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/book_provider.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/empty_state.dart';
import 'widgets/search_bar.dart';
import 'widgets/book_card.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookProvider>().loadBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naat-ul-Nabi'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const CustomSearchBar(),
          Expanded(
            child: Consumer<BookProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading && provider.books.isEmpty) {
                  return const LoadingIndicator(message: 'Loading books...');
                }

                if (provider.error != null && provider.books.isEmpty) {
                  return CustomErrorWidget(
                    message: provider.error!,
                    onRetry: () => provider.loadBooks(),
                  );
                }

                if (provider.books.isEmpty) {
                  return const EmptyState(
                    message: 'No books found',
                    subtitle: 'Check back later for more content',
                    icon: Icons.book_outlined,
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => provider.loadBooks(),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: provider.books.length,
                    itemBuilder: (context, index) {
                      return BookCard(book: provider.books[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
