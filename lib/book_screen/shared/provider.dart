import 'package:base_structure/book_screen/application/book_notifier.dart';
import 'package:base_structure/book_screen/application/detail_book_notifier.dart';
import 'package:base_structure/core/infrastructure/service/book_service.dart';
import 'package:base_structure/gen/generate_proto/lib/proto/book.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

final serviceProvider = Provider((ref) {
  final client = BookMethodsClient(
    ClientChannel(
      "10.10.10.81",
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  );
  return BookService(client);
});

final bookProvider = StateNotifierProvider<BookNotifier, BookState>((ref) {
  return BookNotifier(ref.watch(serviceProvider));
});

final bookDetailProvider =
    StateNotifierProvider<BookDetailNotifier, BookDetailState>((ref) {
  return BookDetailNotifier(ref.watch(serviceProvider));
});
