import 'package:moviestest/movie/data/models/trendingRequest.dart';
import 'models/page.dart';

abstract class MovieDatasource {
  Future<Page> getData(TrendingRequest trendingRequest);
}
