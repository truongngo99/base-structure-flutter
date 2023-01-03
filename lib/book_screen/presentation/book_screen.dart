import 'package:base_structure/book_screen/presentation/widget/create_book.dart';
import 'package:base_structure/book_screen/presentation/widget/item_book.dart';
import 'package:base_structure/book_screen/shared/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:base_structure/gen/generate_proto/lib/proto/book.pb.dart';

class BookScreen extends ConsumerStatefulWidget {
  const BookScreen({super.key});

  @override
  ConsumerState<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends ConsumerState<BookScreen> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    ref.read(bookProvider.notifier).getAllBook();
  }

  @override
  Widget build(BuildContext context) {
    final bookState = ref.watch(bookProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Screen",
        ),
        centerTitle: true,
      ),
      body: bookState.maybeWhen(
          orElse: () => const Center(
                  child: CupertinoActivityIndicator(
                radius: 20,
              )),
          success: (books) => ListView(
                children: books
                    .map(
                      (book) => ItemBook(book: book),
                    )
                    .toList(),
              ),
          failure: (fail) => Center(
                child: Text(fail),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const CreateBook();
            },
          );
        },
        tooltip: "Add Book",
        child: const Icon(Icons.add),
      ),
    );
  }
}
