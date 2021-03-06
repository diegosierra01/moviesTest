import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviestest/trending/domain/entitties/media_type.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';
import 'package:moviestest/trending/domain/errors.dart';
import 'package:moviestest/trending/domain/movie_repository.dart';
import 'package:moviestest/trending/domain/usecases/weekly_movies_impl.dart';

class RepositoryMock extends Mock implements TrendingRepository {}

void main() {
  final repositoryMock = RepositoryMock();
  final usecase = WeeklyMoviesImpl(repositoryMock);

  setUpAll(() {
    registerFallbackValue(
      TrendingRequest(
        page: 1,
        mediaType: 'mediaType',
        timeWindow: 'timeWindow',
      ),
    );
  });

  test(
    'When the conditions are met, should return a page',
    () async {
      when(() => repositoryMock.prepareMoviesPage(any())).thenAnswer(
        (_) async => Right(
          Page([], 10),
        ),
      );
      final result =
          await usecase.loadMovies(2, 10, const MediaType('all', 'Todos'));
      result.fold(
        (error) => null,
        (page) => isA<Page>(),
      );
    },
  );

  test(
    'When the page is greater than the total of pages, should return a PageError',
    () async {
      final result =
          await usecase.loadMovies(11, 10, const MediaType('all', 'Todos'));
      result.fold(
        (error) => isA<MovieLastPageError>(),
        (l) => null,
      );
    },
  );
}
