import 'package:movie_app_flutter/features/movies/data/models/movie_model.dart';
import 'package:movie_app_flutter/features/watchlist/data/datasources/watchlist_data_source.dart';

class WatchlistRepository {
  final WatchlistDataSource _dataSource;

  WatchlistRepository(this._dataSource);

  Future<void> addToWatchlist(MovieModel movie) =>
      _dataSource.addToWatchlist(movie);

  Future<void> removeFromWatchlist(int movieId) =>
      _dataSource.removeFromWatchlist(movieId);

  Stream<List<MovieModel>> getWatchlist() => _dataSource.getWatchlist();
}
