import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/features/movies/data/datasources/movie_remote_datasource.dart';
import 'package:movie_app_flutter/features/movies/data/models/movie_model.dart';
import 'package:movie_app_flutter/features/movies/data/repositories/movie_repository_impl.dart';

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  return MovieRemoteDataSource();
});

final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(movieRemoteDataSourceProvider);
  return MovieRepositoryImpl(remoteDataSource: remoteDataSource);
});

final moviesFutureProvider = FutureProvider<List<MovieModel>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getPopularMovies();
});

final movieDetailProvider = FutureProvider.family<MovieModel, int>((
  ref,
  movieId,
) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getMovieDetail(movieId);
});
