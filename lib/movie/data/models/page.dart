import 'package:moviestest/movie/data/models/movie.dart';

class Page {
  late List<Movie> movies;
  final int totalPages;

  Page({required this.movies, required this.totalPages});

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        movies: (json['results'] as List)
            .map(
              (e) => Movie.fromJson(e),
            )
            .toList(),
        totalPages: json['total_pages'],
      );
}
