import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app_flutter/core/constants/api_constants.dart';

class DioClient {
  final Dio _dio;

  DioClient._() : _dio = Dio() {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final apiKey = dotenv.env['TMDB_API_KEY'];

          if (apiKey == null) {
            return handler.reject(
              DioException(
                requestOptions: options,
                error: 'Error: TMDB_API_KEY not found in .env file',
              ),
            );
          }

          options.queryParameters['api_key'] = apiKey;
          options.queryParameters['language'] = 'es-ES';

          return handler.next(options);
        },
      ),
    );
  }

  static final DioClient _instance = DioClient._();

  static Dio get instance => _instance._dio;
}
