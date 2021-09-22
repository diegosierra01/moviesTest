import 'package:dio/dio.dart';
import 'package:moviestest/interceptor.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';
import 'package:moviestest/trending/data/trending_datasource.dart';
import 'package:moviestest/trending/domain/errors.dart';

class TrendingRequestDatasource implements TrendingDatasource {
  final Dio dioClient;
  final Options options;

  TrendingRequestDatasource(
    this.dioClient,
    this.options,
  );

  void start() {
    dioClient.interceptors.add(AppInterceptors());
  }

  @override
  Future<Page> getData(TrendingRequest trendingRequest) async {
    final response =
        await dioClient.get(trendingRequest.getPath, options: options);
    if (response.statusCode == 200) {
      final result = Page.fromJson(response.data as Map<String, dynamic>);
      return result;
    } else {
      throw MovieDatasourceError();
    }
  }
}
