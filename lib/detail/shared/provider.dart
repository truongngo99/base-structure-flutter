import 'package:base_structure/core/shared/dio_provider.dart';
import 'package:base_structure/detail/application/users_notifier.dart';
import 'package:base_structure/detail/infrastructure/repository/detail_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final repositoryProvider = Provider((ref) {
  return DetailRepository(ref.watch(dioProvider));
});

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>((ref) {
  return UsersNotifier(ref.watch(repositoryProvider));
});
