import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviestest/constants/endpoints.dart';
import 'package:moviestest/trending/data/models/media_element.dart';

class TvShow extends MediaElement {
  final int idTv;
  final String titleTv;
  final DateTime? releaseDateTv;
  final String posterPathTv;

  TvShow({
    required this.idTv,
    required this.titleTv,
    required this.releaseDateTv,
    required this.posterPathTv,
  }) : super(
          id: idTv,
          title: titleTv,
          releaseDate: releaseDateTv,
          posterPath: posterPathTv,
        );

  factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
        idTv: json['id'] as int,
        titleTv: json['name'] as String,
        releaseDateTv: DateTime.tryParse(json['first_air_date'] as String),
        posterPathTv: '${Endpoints.baseUrlImages}${json['poster_path']}',
      );

  @override
  IconData get getIcon => Icons.tv;

  @override
  String get getLabel => 'TV';

  @override
  Color get getLabelColor => const Color(0xFF1F97F3);
}
