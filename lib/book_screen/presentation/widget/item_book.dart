import 'package:base_structure/book_screen/presentation/detail_book.dart';
import 'package:base_structure/book_screen/shared/provider.dart';
import 'package:base_structure/gen/generate_proto/lib/proto/book.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'create_book.dart';

class ItemBook extends ConsumerWidget {
  final Book book;
  const ItemBook({super.key, required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailBookScreen(
                    bookId: BookId(id: book.id),
                  ))),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Slidable(
            key: UniqueKey(),
            direction: Axis.horizontal,
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 1,
                  onPressed: (context) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CreateBook(
                          book: book,
                          isEdit: true,
                        );
                      },
                    );
                  },
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                SlidableAction(
                  flex: 1,
                  onPressed: (context) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Are you sure you want to delete?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                ref
                                    .read(bookProvider.notifier)
                                    .deleteBook(BookId(id: book.id));

                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Row(
              children: [
                // Image.network(
                //   book.imageUrl,
                //   height: 100,
                //   width: 70,
                //   fit: BoxFit.cover,
                // ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  book.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
