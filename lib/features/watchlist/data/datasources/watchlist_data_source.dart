import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_flutter/features/movies/data/models/movie_model.dart';

class WatchlistDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Anadir pelicula a la watchlist
  Future<void> addToWatchlist(MovieModel movie) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('User not logged in');

    final docRef = _firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .doc(movie.id.toString());

    // Mapa de datos
    await docRef.set({
      'id': movie.id,
      'title': movie.title,
      'overview': movie.overview,
      'poster_path': movie.posterPath,
      'vote_average': movie.voteAverage,
    });
  }

  // Quitar pelicula de la watchlist
  Future<void> removeFromWatchlist(int movieId) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('User not logged in');

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .doc(movieId.toString())
        .delete();
  }

  // Obtener watchlist
  Stream<List<MovieModel>> getWatchlist() {
    final user = _auth.currentUser;
    if (user == null) return Stream.value([]);

    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => MovieModel.fromJson(doc.data()))
              .toList();
        });
  }
}
