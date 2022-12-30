import 'package:base_structure/core/infrastructure/logger.dart';
import 'package:grpc/service_api.dart';

class PerformanceInterceptor implements ClientInterceptor {
  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker) {
    invoker(method, requests, options).listen((value) {
      logger.d("[gRPC] Request: ${method.path}\n$value\n ");
    }, onError: (e) {
      logger.e(e);
    });
    return invoker(method, requests, options);
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request,
      CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    invoker(method, request, options).then((value) {
      logger.d("[gRPC] Request: ${method.path}\n$value");
    }, onError: (e) {
      logger.e(e);
    });

    return invoker(method, request, options);
  }
}
