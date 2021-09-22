import 'package:moviestest/trending/data/models/media_distribuitor.dart';

class Page {
  final List<Media> movies;
  final int totalPages;

  Page(this.movies, this.totalPages);

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        (json['results'] as List)
            .map(
              (e) => Media.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        json['total_pages'] as int,
      );
}
