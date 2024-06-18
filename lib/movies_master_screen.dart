import 'package:fakeflix/movie_preview.dart';
import 'package:flutter/material.dart';
import '../movie_service.dart';
import '../movie.dart';
import 'movie_details_screen.dart';

class MoviesMasterScreen extends StatefulWidget {
  const MoviesMasterScreen({super.key});

  @override
  _MoviesMasterScreenState createState() => _MoviesMasterScreenState();
}

class _MoviesMasterScreenState extends State<MoviesMasterScreen> {
  final MovieService _movieService = MovieService();
  Future<List<Movie>>? _movies;

  @override
  void initState() {
    super.initState();
    _movies = _movieService.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu principal'),
        flexibleSpace: FlexibleSpaceBar(background : Image.asset('images/fakeflix.png') ,),
        
      ),
      body:
       FutureBuilder<List<Movie>>(
        future: _movies,
        builder: (context, snapshot) {
            final movies = snapshot.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MoviePreview(
                  movie: movie,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(movieId: movie.id),
                      ),
                    );
                  },
                );
              },
            );
          }
      ),
    );
  }
}
