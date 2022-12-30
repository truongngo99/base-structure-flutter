import 'package:base_structure/core/infrastructure/service/book_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/failure.dart';
import 'package:base_structure/gen/generate_proto/lib/proto/book.pb.dart';

part 'detail_book_notifier.freezed.dart';

@freezed
class BookDetailState with _$BookDetailState {
  const BookDetailState._();
  const factory BookDetailState.initial() = _Initial;
  const factory BookDetailState.success(Book book) = _Sucess;
  const factory BookDetailState.failure(ApiFailure apiFailure) = _Failure;
}

class BookDetailNotifier extends StateNotifier<BookDetailState> {
  final BookService _bookService;
  BookDetailNotifier(this._bookService)
      : super(const BookDetailState.initial());

  void getBook(BookId bookId) async {
    Either<ApiFailure, Book> failureOrSucces =
        await _bookService.getBook(bookId);

    state = failureOrSucces.fold(
        (l) => BookDetailState.failure(l), (r) => BookDetailState.success(r));
  }
}
