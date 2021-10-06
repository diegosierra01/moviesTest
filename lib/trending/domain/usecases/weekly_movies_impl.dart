import 'package:dartz/dartz.dart';
import 'package:moviestest/errors/errors.dart';
import 'package:moviestest/trending/domain/entitties/media_type.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';
import 'package:moviestest/trending/domain/errors.dart';
import 'package:moviestest/trending/domain/movie_repository.dart';
import 'package:moviestest/trending/domain/usecases/filtered_movies.dart';

class WeeklyMoviesImpl extends FilteredMovies {
  final TrendingRepository _trendingRepository;

  WeeklyMoviesImpl(this._trendingRepository);

  @override
  Future<Either<GenericError, Page>> loadMovies(
    int currentPage,
    int? totalPages,
    MediaType mediaType,
  ) async {
    const timeWindow = 'week';
    final bool _available = isAvailablePage(currentPage, totalPages);
    if (_available) {
      return await _trendingRepository.prepareMoviesPage(
        TrendingRequest(
          mediaType: mediaType.value,
          timeWindow: timeWindow,
          page: currentPage,
        ),
      );
    } else {
      return Left(MovieLastPageError());
    }
  }
}
