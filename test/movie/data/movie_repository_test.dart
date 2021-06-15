import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviestest/constants/endpoints.dart';
import 'package:moviestest/movie/data/models/movie.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';
import 'package:moviestest/movie/data/movie_datasource.dart';
import 'package:moviestest/movie/data/movie_repostory_impl.dart';
import 'package:moviestest/movie/domain/errors.dart';

class DatasourceMock extends Mock implements MovieDatasource {}

void main() {
  final datasourceMock = DatasourceMock();
  final repository = MovieRepositoryImpl(datasourceMock);
  final requestInfo = TrendingRequest(
      apiKey: 'apiKey',
      page: 1,
      mediaType: 'mediaType',
      timeWindow: 'timeWindow');

  test(
      'When get the list should return a modified list with the complet path of each image',
      () async {
    when(() => datasourceMock.getData(requestInfo)).thenAnswer(
      (_) async => <Movie>[
        Movie(
          id: 1,
          posterPath: 'path.jpg',
          releaseDate: DateTime(2010),
          title: 'my movie',
        )
      ],
    );
    final result = await repository.prepareMovieList(requestInfo);
    result.fold((list) {
      expect(list, isA<List<Movie>>());
      expect(
        list[0].posterPath,
        contains(Endpoints.baseUrlImages),
      );
    }, (r) => null);
  });

  test(
      'When throws an error that is not generic, should return RepositoryError',
      () async {
    when(() => datasourceMock.getData(requestInfo)).thenAnswer(
      (_) async => throw Exception(),
    );
    final result = await repository.prepareMovieList(requestInfo);
    result.fold(
      (l) => null,
      (error) => expect(error, isA<MovieRepositoryError>()),
    );
  });
}
