import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure.noConnection() = _NoConnection;
  const factory Failure.server(String? errorCode, String? message) = Server;

  // void handleFailure(BuildContext context) => when(
  //     noConnection: () => showNetworkToast(context),
  //     error: (_, message) => showToast(context, message));
}
