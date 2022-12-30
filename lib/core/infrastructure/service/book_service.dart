import 'package:base_structure/core/domain/failure.dart';
import 'package:base_structure/gen/generate_proto/lib/proto/book.pbgrpc.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

class BookService {
  final BookMethodsClient client;
  BookService(this.client);
  Future<Either<ApiFailure, Books>> getAllBook() async {
    try {
      final books = await client.getAllBooks(Empty());
      return right(books);
    } on GrpcError catch (e) {
      return left(ApiFailure.server(e.codeName));
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }

  Future<Either<ApiFailure, Empty>> deleteBook(BookId id) async {
    try {
      await client.deleteBook(id);
      return right(Empty());
    } on GrpcError catch (e) {
      return left(ApiFailure.server(e.codeName));
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }

  Future<Either<ApiFailure, Empty>> createBook(Book book) async {
    try {
      await client.createBook(book);

      return right(Empty());
    } on GrpcError catch (e) {
      return left(ApiFailure.server(e.codeName));
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }

  Future<Either<ApiFailure, Empty>> editBook(Book book) async {
    try {
      await client.createBook(book);

      return right(Empty());
    } on GrpcError catch (e) {
      return left(ApiFailure.server(e.codeName));
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }

  Future<Either<ApiFailure, Book>> getBook(BookId bookId) async {
    try {
      return right(await client.getBook(bookId));
    } on GrpcError catch (e) {
      return left(ApiFailure.server(e.codeName));
    } catch (e) {
      return left(ApiFailure.server(e.toString()));
    }
  }
}
