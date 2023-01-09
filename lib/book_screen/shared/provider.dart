import 'package:base_structure/book_screen/application/book_notifier.dart';
import 'package:base_structure/book_screen/application/detail_book_notifier.dart';
import 'package:base_structure/core/infrastructure/grpc_interceptor.dart';
import 'package:base_structure/core/infrastructure/service/book_service.dart';
import 'package:base_structure/flavors.dart';
import 'package:base_structure/gen/generate_proto/lib/proto/book.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final serviceProvider = Provider((ref) {
  final client = BookMethodsClient(
    ClientChannel(
      F.localhost,
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
    interceptors: [PerformanceInterceptor()],
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
