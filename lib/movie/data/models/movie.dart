class Movie {
  final int id;
  final String title;
  late DateTime releaseDate;
  late String posterPath;

  Movie({
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    var releaseDate = json['release_date'];
    if (releaseDate != null && releaseDate?.isNotEmpty) {
      releaseDate = DateTime.parse(json['release_date']);
    } else {
      releaseDate = DateTime(0);
    }
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      releaseDate: releaseDate,
      posterPath: json['poster_path'] ?? '',
    );
  }
}
