import 'package:intl/intl.dart';
import 'package:moviestest/constants/endpoints.dart';

class Movie {
  final int id;
  final String title;
  final DateTime? releaseDate;
  final String posterPath;

  Movie({
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'] as int,
        title: json['title'] as String,
        releaseDate: DateTime.tryParse(json['release_date'] as String),
        posterPath: '${Endpoints.baseUrlImages}${json['poster_path']}',
      );

  String _getMonthName() =>
      DateFormat.MMMM('es').format(releaseDate!).toString();

  String get getDefaultDateFormat =>
      '${releaseDate?.day} de ${_getMonthName()} del ${releaseDate?.year}';
}
