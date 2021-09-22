import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moviestest/trending/data/models/movie.dart';
import 'package:moviestest/trending/data/models/tv_show.dart';

abstract class Media {
  final int id;
  final String title;
  final DateTime? releaseDate;
  final String posterPath;

  Media({
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    final String mediaType = json['media_type'] as String;
    switch (mediaType) {
      case 'movie':
        return Movie.fromJson(json);
      case 'tv':
        return TvShow.fromJson(json);
      default:
        return Movie.fromJson(json);
    }
  }

  String _getMonthName() =>
      DateFormat.MMMM('es').format(releaseDate!).toString();

  String get getDefaultDateFormat =>
      '${releaseDate?.day} de ${_getMonthName()} del ${releaseDate?.year}';

  IconData get getIcon;

  String get getLabel;

  Color get getLabelColor;
}
