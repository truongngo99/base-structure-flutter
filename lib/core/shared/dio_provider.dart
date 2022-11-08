import 'package:base_structure/core/infrastructure/dio_logger_interceptor.dart';
import 'package:base_structure/core/infrastructure/logger.dart';
import 'package:base_structure/flavors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final baseOptionsProvider = Provider((ref) {
  return BaseOptions(
    baseUrl: F.baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
});

final dioLoggerInterceptorProvider =
    Provider((ref) => DioLoggerInterceptor(logger));

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final options = ref.watch(baseOptionsProvider);
  final dioLoggerInterceptor = ref.watch(dioLoggerInterceptorProvider);
  dio
    ..options = options
    ..interceptors.addAll(
      [
        if (kDebugMode) dioLoggerInterceptor,
      ],
    );
  return dio;
});
