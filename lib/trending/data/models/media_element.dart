import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moviestest/trending/data/models/movie.dart';
import 'package:moviestest/trending/data/models/tv_show.dart';
import 'package:moviestest/trending/domain/entitties/media_entity.dart';

abstract class MediaElement implements MediaEntity {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime? releaseDate;
  @override
  final String posterPath;

  MediaElement({
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.posterPath,
  });

  static MediaElement classify(Map<String, dynamic> json) {
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

  IconData get getIcon;

  String get getLabel;

  Color get getLabelColor;

  String _getMonthName() =>
      DateFormat.MMMM('es').format(releaseDate!).toString();

  String get getDefaultDateFormat =>
      '${releaseDate?.day} de ${_getMonthName()} del ${releaseDate?.year}';
}
