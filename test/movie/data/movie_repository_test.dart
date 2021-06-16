import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviestest/constants/endpoints.dart';
import 'package:moviestest/movie/data/models/movie.dart';
import 'package:moviestest/movie/data/models/page.dart';
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

  setUpAll(() {
    registerFallbackValue(requestInfo);
  });

  test(
      'When get the list should return a modified list with the complet path of each image',
      () async {
    when(() => datasourceMock.getData(any())).thenAnswer(
      (_) async => Page(
        movies: [
          Movie(
              id: 1,
              posterPath: 'path.jpg',
              releaseDate: DateTime(2010),
              title: 'my movie')
        ],
        totalPages: 1,
      ),
    );
    final result = await repository.prepareMovieList(requestInfo);
    result.fold((page) {
      expect(page.movies, isA<List<Movie>>());
      expect(
        page.movies[0].posterPath,
        contains(Endpoints.baseUrlImages),
      );
    }, (r) => null);
  });

  test(
      'When throws an error that is not generic, should return RepositoryError',
      () async {
    when(() => datasourceMock.getData(any())).thenAnswer(
      (_) async => throw Exception(),
    );
    final result = await repository.prepareMovieList(requestInfo);
    result.fold(
      (l) => null,
      (error) => expect(error, isA<MovieRepositoryError>()),
    );
  });
}
