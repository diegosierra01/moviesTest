import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/constants/endpoints.dart';
import 'package:moviestest/trending/data/models/media_distribuitor.dart';

class Movie extends Media {
  final int idMovie;
  final String titleMovie;
  final DateTime? releaseDateMovie;
  final String posterPathMovie;

  Movie({
    required this.idMovie,
    required this.titleMovie,
    required this.releaseDateMovie,
    required this.posterPathMovie,
  }) : super(
          id: idMovie,
          title: titleMovie,
          releaseDate: releaseDateMovie,
          posterPath: posterPathMovie,
        );

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        idMovie: json['id'] as int,
        titleMovie: json['title'] as String,
        releaseDateMovie: DateTime.tryParse(json['release_date'] as String),
        posterPathMovie: '${Endpoints.baseUrlImages}${json['poster_path']}',
      );

  @override
  IconData get getIcon => Icons.movie_creation_outlined;

  @override
  String get getLabel => 'Filme';

  @override
  Color get getLabelColor => const Color(0xFF9E5D33);
}
