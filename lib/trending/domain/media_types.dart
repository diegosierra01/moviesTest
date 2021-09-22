import 'package:moviestest/trending/data/models/media_type.dart';

class MediaTypes {
  MediaTypes._internal();
  static MediaTypes? _instance;
  static MediaTypes? get instance {
    _instance ??= MediaTypes._internal();
    return _instance;
  }

  static const List<MediaType> mainList = [
    MediaType('all', 'Todos'),
    MediaType('movie', 'Películas'),
    MediaType('tv', 'Programas TV')
  ];

  final MediaType defaultMediaType = mainList[0];
}
