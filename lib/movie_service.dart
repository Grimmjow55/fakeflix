import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'movie.dart';

class MovieService {
  final Dio _dio;
  final String? apiKey = dotenv.env['API_KEY'];
  final String? baseUrl = dotenv.env['BASE_URL'];

  MovieService()
      : _dio = Dio(BaseOptions(
          baseUrl: dotenv.env['BASE_URL']!,
          queryParameters: {'api_key': dotenv.env['API_KEY']},
        ));

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await _dio.get('/movie/popular');
      List<dynamic> results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to load popular movies: ${e.message}');
    }
  }

  Future<Movie> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get('/movie/$movieId');
      return Movie.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load movie details: ${e.message}');
    }
  }
}
