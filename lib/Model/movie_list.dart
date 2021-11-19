import 'movie.dart';

class MovieList {
  MovieList({
    required this.pageNumber,
    required this.limit,
    required this.movies
  });


  late int pageNumber;
  late int limit;
  late List<Movie> movies;

  MovieList.fromJson(Map<String, dynamic> json) {
    pageNumber = json['data']['page_number'];
    limit = json['data']['limit'];

    if (json['data']['movies'] != null) {
      movies = <Movie>[];

      json['data']['movies'].forEach((v) {
        movies.add(Movie.fromJson(v));
      });
    }
  }
}