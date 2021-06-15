import 'package:moviestest/movie/data/models/movie.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getData(TrendingRequest trendingRequest);
}
