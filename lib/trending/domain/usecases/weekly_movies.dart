import 'package:dartz/dartz.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';
import 'package:moviestest/trending/domain/errors.dart';
import 'package:moviestest/trending/domain/movie_repository.dart';

abstract class FilteredMovies {
  Future<Either<GenericError, Page>> loadMovies(
      int currentPage, int totalPages);
}

class WeeklyMoviesImpl implements FilteredMovies {
  final MovieRepository _movieRepository;

  WeeklyMoviesImpl(this._movieRepository);

  @override
  Future<Either<GenericError, Page>> loadMovies(
    int currentPage,
    int totalPages,
  ) async {
    final bool _available =
        _movieRepository.isAvailablePage(currentPage, totalPages);
    if (_available) {
      return await _movieRepository.prepareMoviesPage(
        TrendingRequest(
          mediaType: 'movie',
          timeWindow: 'week',
          page: currentPage,
        ),
      );
    } else {
      return Left(MoviePageError());
    }
  }
}
