import 'package:base_structure/core/domain/failure.dart';
import 'package:base_structure/detail/infrastructure/model/users.dart';
import 'package:base_structure/detail/infrastructure/repository/detail_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_notifier.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const UsersState._();
  const factory UsersState.loading() = _Loading;
  const factory UsersState.success(Users users) = _Success;
  const factory UsersState.error(Failure failure) = _Failure;
}

class UsersNotifier extends StateNotifier<UsersState> {
  UsersNotifier(this._detailRepository) : super(const UsersState.loading());

  final DetailRepository _detailRepository;

  Future<void> getListUsers() async {
    final failureOrSuccess = await _detailRepository.getListUser();

    state = failureOrSuccess.fold(
      (l) => UsersState.error(l),
      (r) => UsersState.success(r),
    );
  }
}
