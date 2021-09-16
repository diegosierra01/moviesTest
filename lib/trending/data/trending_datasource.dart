import 'package:moviestest/trending/data/models/trending_request.dart';
import 'package:moviestest/trending/data/models/page.dart';

abstract class MovieDatasource {
  Future<Page> getData(TrendingRequest trendingRequest);
}
