import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../error/exceptions.dart';
import 'interceptors.dart';


class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    // إضافة الـ Interceptor هنا
    _dio.interceptors.add(LoggerInterceptor());
  }

  Future<Either<AppException, Response>> getEither(
      String url, {
        FunctionType? function,
      }) async {
    try {
      final response = await _dio.get(url);
      return Right(response);

    } on DioException catch (e) {
      return Left(
        handleErrorByStatusCode(
          e.response?.statusCode,
          function: function,
          serverMessage: e.response?.data,
        ),
      );
    }
  }
}
