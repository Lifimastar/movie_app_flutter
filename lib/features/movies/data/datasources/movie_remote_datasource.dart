import 'package:dio/dio.dart';
import 'package:movie_app_flutter/core/network/dio_client.dart';
import 'package:movie_app_flutter/features/movies/data/models/movie_model.dart';

class MovieRemoteDataSource {
  final Dio _dio = DioClient.instance;

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await _dio.get('/movie/popular');

      final List<dynamic> results = response.data['results'];

      final List<MovieModel> movies = results
          .map((movieJson) => MovieModel.fromJson(movieJson))
          .toList();

      return movies;
    } on DioException catch (e) {
      print('Error en getPopularMovies: $e');
      throw Exception('Failed to load popular movies');
    }
  }

  Future<MovieModel> getMovieDetail(int movieId) async {
    try {
      final response = await _dio.get('/movie/$movieId');
      final movie = MovieModel.fromJson(response.data);
      return movie;
    } on DioException catch (e) {
      print('Error en getMovieDetail: $e');
      throw Exception('Failed to load movie detail');
    }
  }
}
