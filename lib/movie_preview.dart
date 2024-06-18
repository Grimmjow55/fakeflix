import 'package:flutter/material.dart';
import '../movie.dart';

class MoviePreview extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MoviePreview({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      color: const Color.fromARGB(255, 30, 30, 30),
      child: ListTile(
        leading : Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}',fit: BoxFit.cover),
        title: Text(movie.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        onTap: onTap,
      )
    );
  }
}
