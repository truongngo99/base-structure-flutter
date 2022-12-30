import 'package:base_structure/core/domain/failure.dart';
import 'package:base_structure/gen/generate_proto/lib/proto/book.pbgrpc.dart';
import 'package:dartz/dartz.dart';

class BookService {
  final BookMethodsClient client;
  BookService(this.client);
  Future<Either<ApiFailure, Books>> getAllBook() async {
    try {
      final books = await client.getAllBooks(Empty());
      return right(books);
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }

  Future<Either<ApiFailure, Empty>> deleteBook(BookId id) async {
    try {
      await client.deleteBook(id);
      return right(Empty());
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }

  Future<Either<ApiFailure, Empty>> createBook(Book book) async {
    try {
      await client.createBook(book);

      return right(Empty());
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }

  Future<Either<ApiFailure, Empty>> editBook(Book book) async {
    try {
      await client.createBook(book);

      return right(Empty());
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }

  Future<Either<ApiFailure, Book>> getBook(BookId bookId) async {
    try {
      return right(await client.getBook(bookId));
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }
}
