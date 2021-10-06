import 'package:dio/dio.dart';
import 'package:moviestest/interceptor.dart';
import 'package:moviestest/services/rest_service/dio_service_impl.dart';
import 'package:moviestest/services/rest_service/rest_service.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';
import 'package:moviestest/trending/data/datasource/trending_datasource.dart';

class TrendingDioDatasource implements TrendingDatasource {
  final RestService _restService;

  TrendingDioDatasource(this._restService);

  @override
  Future<Page> getData(TrendingRequest trendingRequest) async {
    final response = await _restService.get(path: trendingRequest.getPath).catchError(_restService.onError);
    return Page.fromJson(response);
  }
}
