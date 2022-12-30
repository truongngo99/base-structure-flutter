import 'package:base_structure/book_screen/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:base_structure/gen/generate_proto/lib/proto/book.pb.dart';

class CreateBook extends ConsumerStatefulWidget {
  final bool isEdit;
  final Book? book;
  const CreateBook({super.key, this.book, this.isEdit = false});

  @override
  ConsumerState<CreateBook> createState() => _CreateBookState();
}

class _CreateBookState extends ConsumerState<CreateBook> {
  TextEditingController idCtl = TextEditingController();
  TextEditingController nameCtl = TextEditingController();
  TextEditingController imageCtl = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idCtl.text = widget.book?.id.toString() ?? "";
    nameCtl.text = widget.book?.title ?? "";
    imageCtl.text = widget.book?.imageUrl.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              widget.isEdit ? "Edit Book" : "Create Book",
              style: textTheme.headline5,
            )),
            Text(
              "id",
              style: textTheme.headline6,
            ),
            TextField(
              controller: idCtl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "id"),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "title",
              style: textTheme.headline6,
            ),
            TextField(
              controller: nameCtl,
              decoration: const InputDecoration(hintText: "Book Title"),
            ),
            Text(
              "Image",
              style: textTheme.headline6,
            ),
            TextField(
              controller: imageCtl,
              decoration: const InputDecoration(hintText: "Image"),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close")),
                ElevatedButton(
                    onPressed: () {
                      final book = Book(
                          id: int.parse(idCtl.text),
                          title: nameCtl.text,
                          imageUrl: imageCtl.text);
                      widget.isEdit
                          ? ref.read(bookProvider.notifier).editBook(book)
                          : ref.read(bookProvider.notifier).createBook(book);
                      Navigator.pop(context);
                    },
                    child: const Text("Confirm")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
