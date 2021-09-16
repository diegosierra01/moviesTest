import 'package:moviestest/trending/data/models/movie.dart';

class Page {
  final List<Movie> movies;
  final int totalPages;

  Page(this.movies, this.totalPages);

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        (json['results'] as List)
            .map(
              (e) => Movie.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        json['total_pages'] as int,
      );
}
