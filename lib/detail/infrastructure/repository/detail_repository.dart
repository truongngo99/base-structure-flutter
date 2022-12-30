import 'package:base_structure/core/domain/failure.dart';
import 'package:base_structure/detail/infrastructure/model/users.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DetailRepository {
  final Dio _dio;
  DetailRepository(this._dio);

  Future<Either<ApiFailure, Users>> getListUser() async {
    try {
      Response res = await _dio.get("/api/users", queryParameters: {
        "page": 2,
      });
      return right(Users.fromJson(res.data));
    } on DioError catch (e) {
      return left(ApiFailure.server(e.message));
    }
  }
}
