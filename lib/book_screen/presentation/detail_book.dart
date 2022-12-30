import 'package:base_structure/book_screen/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:base_structure/gen/generate_proto/lib/proto/book.pb.dart';

class DetailBookScreen extends HookConsumerWidget {
  final BookId bookId;
  const DetailBookScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(bookDetailProvider.notifier).getBook(bookId);

      return null;
    }, []);
    final bookDetailState = ref.watch(bookDetailProvider);
    final titleAppBar =
        bookDetailState.maybeWhen(orElse: () {}, success: (book) => book.title);

    final imageUrl = bookDetailState.maybeWhen(
        orElse: () {}, success: (book) => book.imageUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text(titleAppBar ?? ""),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child:
              imageUrl == null ? const FlutterLogo() : Image.network(imageUrl),
        ),
      ),
    );
  }
}
