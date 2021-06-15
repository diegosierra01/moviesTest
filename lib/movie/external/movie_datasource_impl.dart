import 'package:dio/dio.dart';
import 'package:moviestest/constants/endpoints.dart';
import 'package:moviestest/movie/data/models/movie.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';
import 'package:moviestest/movie/data/movie_datasource.dart';
import 'package:moviestest/movie/domain/errors.dart';

class MovieDatasourceImpl implements MovieDatasource {
  final Dio dioClient;
  final Options options;

  MovieDatasourceImpl(this.dioClient, this.options);

  @override
  Future<List<Movie>> getData(TrendingRequest trendingRequest) async {
    final url = Endpoints.baseUrl + trendingRequest.getPath();
    final response = await dioClient.get(url, options: options);
    if (response.statusCode == 200) {
      final list = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      return list;
    } else {
      throw MovieDatasourceError();
    }
  }
}
