class Movie {
  final int id;
  final DateTime releaseDate;
  final String title;
  late String posterPath;

  Movie({
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'],
        title: json['title'],
        releaseDate: DateTime.parse(json['release_date']),
        posterPath: json['poster_path'],
      );
}
