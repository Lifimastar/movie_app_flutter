import 'package:movie_app_flutter/features/movies/data/datasources/movie_remote_datasource.dart';
import 'package:movie_app_flutter/features/movies/data/models/movie_model.dart';
import 'package:movie_app_flutter/features/movies/data/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final movies = await remoteDataSource.getPopularMovies();
      return movies;
    } catch (e) {
      print('Error en MovieRepositoryImpl: $e');
      throw Exception('Failed to load movies from repository');
    }
  }

  Future<MovieModel> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return movie;
    } catch (e) {
      print('Error en MovieRepositoryImpl getMovieDetail: $e');
      throw Exception('Failed to load movie detail from repository');
    }
  }
}
