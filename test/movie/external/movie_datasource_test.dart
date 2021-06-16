import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviestest/movie/data/models/page.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';
import 'package:moviestest/movie/domain/errors.dart';
import 'package:moviestest/movie/external/movie_datasource_impl.dart';

import '../../sample/response_movie.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dioMock = DioMock();
  final datasource = MovieDatasourceImpl(
    dioMock,
    Options(followRedirects: false, validateStatus: (status) => status! < 500),
  );
  final requestInfo = TrendingRequest(
      apiKey: 'apiKey',
      page: 1,
      mediaType: 'mediaType',
      timeWindow: 'timeWindow');

  test(
    'When statusCode is 200, should return a page',
    () async {
      when(() => dioMock.get(any(),
          options: any(named: 'options', that: isNotNull))).thenAnswer(
        (_) async => Response(
          data: jsonDecode(responseMovieSample),
          statusCode: 200,
          requestOptions: RequestOptions(path: 'path'),
        ),
      );
      final result = await datasource.getData(requestInfo);
      expect(result, isA<Page>());
    },
  );

  test(
    'When statusCode is not 200, should throw a datasource error',
    () async {
      when(() => dioMock.get(any(),
          options: any(named: 'options', that: isNotNull))).thenAnswer(
        (_) async => Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: 'path'),
        ),
      );
      try {
        await datasource.getData(requestInfo);
      } catch (error) {
        expect(error, isA<MovieDatasourceError>());
      }
    },
  );
}
