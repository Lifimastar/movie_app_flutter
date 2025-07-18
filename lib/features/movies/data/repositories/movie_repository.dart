import 'package:movie_app_flutter/features/movies/data/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<MovieModel> getMovieDetail(int id);
}