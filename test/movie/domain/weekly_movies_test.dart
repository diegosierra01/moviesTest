import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviestest/movie/data/models/page.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';
import 'package:moviestest/movie/domain/errors.dart';
import 'package:moviestest/movie/domain/movie_repository.dart';
import 'package:moviestest/movie/domain/usecases/weeklyMovies.dart';

class RepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repositoryMock = RepositoryMock();
  final usecase = WeeklyMoviesImpl(repositoryMock);

  setUpAll(() {
    registerFallbackValue(
      TrendingRequest(
        apiKey: 'apiKey',
        page: 1,
        mediaType: 'mediaType',
        timeWindow: 'timeWindow',
      ),
    );
  });

  test(
    'When the conditions are met, should return a page',
    () async {
      when(() => repositoryMock.prepareMovieList(any())).thenAnswer(
        (_) async => Left(
          Page(totalPages: 10, movies: []),
        ),
      );
      final result = await usecase.load(1, 10);
      result.fold(
        (page) => isA<Page>(),
        (r) => null,
      );
    },
  );

  test(
    'When the page is greater than the total of pages, should return a PageError',
    () async {
      final result = await usecase.load(11, 10);
      result.fold(
        (l) => null,
        (error) => isA<MoviePageError>(),
      );
    },
  );
}
