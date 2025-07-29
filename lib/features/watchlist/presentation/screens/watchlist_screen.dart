import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/core/theme/app_theme.dart';
import 'package:movie_app_flutter/features/movies/data/models/movie_model.dart';
import 'package:movie_app_flutter/features/watchlist/presentation/providers/watchlist_providers.dart';

class WatchlistScreen extends ConsumerWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistAsyncValue = ref.watch(watchlistProvider);

    return Scaffold(
      backgroundColor: AppTheme.loginBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.loginBackgroundColor,
        title: const Text('Watchlist'),
        centerTitle: true,
        elevation: 0,
      ),
      body: watchlistAsyncValue.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const Center(
              child: Text(
                'Tu watchlist esta vacia.',
                style: TextStyle(color: AppTheme.placeholderColor),
              ),
            );
          }
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return _WatchlistItem(movie: movie);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('Error: $err', style: const TextStyle(color: Colors.red)),
        ),
      ),
    );
  }
}

// Widget para cada item de la watchlist
class _WatchlistItem extends StatelessWidget {
  final MovieModel movie;
  const _WatchlistItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Row(
        children: [
          // Imagen
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              movie.fullPosterUrl,
              width: 56,
              height: 84,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 56,
                height: 84,
                color: Colors.grey.shade800,
                child: const Icon(Icons.movie, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Textos
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Calificacion: ${movie.voteAverage.toStringAsFixed(1)}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xffc89396),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
