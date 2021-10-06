import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviestest/constants/endpoints.dart';
import 'package:moviestest/trending/data/models/media_element.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';
import 'package:moviestest/trending/data/datasource/trending_datasource.dart';
import 'package:moviestest/trending/data/trending_repository_impl.dart';
import 'package:moviestest/trending/domain/errors.dart';

class DatasourceMock extends Mock implements TrendingDatasource {}

void main() {
  final datasourceMock = DatasourceMock();
  final repository = TrendingPageRepository(datasourceMock);
  final requestInfo = TrendingRequest(
      page: 1, mediaType: 'mediaType', timeWindow: 'timeWindow');

  setUpAll(() {
    registerFallbackValue(requestInfo);
  });

  test(
      'When get the list should return a modified list with the complet path of each image',
      () async {
    when(() => datasourceMock.getData(any())).thenAnswer(
      (_) async => Page(
        [
          MediaElement.factoryClassify(
            {
              'id': 423108,
              'poster_path': '/xbSuFiJbbBWCkyCCKIMfuDCA4yV.jpg',
              'title': 'The Conjuring: The Devil Made Me Do It',
              'release_date': '2021-05-25',
              'media_type': 'movie'
            },
          )
        ],
        1,
      ),
    );
    final result = await repository.prepareMoviesPage(requestInfo);
    result.fold(
      (r) => null,
      (page) {
        expect(page.movies, isA<List<MediaElement>>());
        expect(
          page.movies[0].posterPath,
          contains(Endpoints.baseUrlImages),
        );
      },
    );
  });

  test(
      'When throws an error that is not generic, should return RepositoryError',
      () async {
    when(() => datasourceMock.getData(any())).thenAnswer(
      (_) async => throw Exception(),
    );
    final result = await repository.prepareMoviesPage(requestInfo);
    result.fold(
      (error) => expect(error, isA<MovieRepositoryError>()),
      (l) => null,
    );
  });
}
