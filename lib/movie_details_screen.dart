import 'package:flutter/material.dart';
import '../movie_service.dart';
import '../movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final MovieService _movieService = MovieService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details du film'),
      ),
      body: FutureBuilder<Movie>(
        future: _movieService.getMovieDetails(movieId),
        builder: (context, snapshot) {
            final movie = snapshot.data!;
            return Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Image(image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                    width: MediaQuery.of(context).size.width * 0.5,
                    
                    ),
                  const SizedBox(height: 8),

                  Text(
                    movie.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Release Date: ${movie.releaseDate}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(movie.overview),
                ],
              ),
            );
          }
      ),
    );
  }
}
