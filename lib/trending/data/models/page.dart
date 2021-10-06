import 'package:moviestest/trending/data/models/media_element.dart';

class Page {
  final List<MediaElement> movies;
  final int totalPages;

  Page(this.movies, this.totalPages);

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        (json['results'] as List)
            .map(
              (e) => MediaElement.factoryClassify(e as Map<String, dynamic>),
            )
            .toList(),
        json['total_pages'] as int,
      );
}
