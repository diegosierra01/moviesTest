import 'package:dio/dio.dart';
import 'package:moviestest/constants/endpoints.dart';
import 'package:moviestest/movie/data/models/page.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';
import 'package:moviestest/movie/data/movie_datasource.dart';
import 'package:moviestest/movie/domain/errors.dart';

class MovieDatasourceImpl implements MovieDatasource {
  final Dio dioClient;
  final Options options;

  MovieDatasourceImpl(this.dioClient, this.options);

  @override
  Future<Page> getData(TrendingRequest trendingRequest) async {
    final url = Endpoints.baseUrl + trendingRequest.getPath();
    final response = await dioClient.get(url, options: options);
    if (response.statusCode == 200) {
      final result = Page.fromJson(response.data);
      return result;
    } else {
      throw MovieDatasourceError();
    }
  }
}
