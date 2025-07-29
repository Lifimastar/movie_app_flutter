import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/features/movies/data/models/movie_model.dart';
import 'package:movie_app_flutter/features/watchlist/data/datasources/watchlist_data_source.dart';
import 'package:movie_app_flutter/features/watchlist/data/repositories/watchlist_repository.dart';

// Provider para el DataSource
final watchlistDataSourceProvider = Provider((ref) => WatchlistDataSource());

// Provider para el Repositorio
final watchlistRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(watchlistDataSourceProvider);
  return WatchlistRepository(dataSource);
});

// StreamProvider para obtener la watchlist en tiempo real
final watchlistProvider = StreamProvider<List<MovieModel>>((ref) {
  final repository = ref.watch(watchlistRepositoryProvider);
  return repository.getWatchlist();
});
