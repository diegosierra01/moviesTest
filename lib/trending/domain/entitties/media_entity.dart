abstract class MediaEntity {
  final int id;
  final String title;
  final DateTime? releaseDate;
  final String posterPath;

  MediaEntity({
    required this.id,
    required this.title,
    this.releaseDate,
    required this.posterPath,
  });
}
