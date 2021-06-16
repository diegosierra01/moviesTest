import 'package:dartz/dartz.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/movie/data/models/page.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';
import 'package:moviestest/movie/domain/errors.dart';
import 'package:moviestest/movie/domain/movie_repository.dart';

abstract class WeeklyMovies {
  Future<Either<Page, GenericError>> load(int page, int total);
}

class WeeklyMoviesImpl implements WeeklyMovies {
  final MovieRepository _movieRepository;

  WeeklyMoviesImpl(this._movieRepository);

  @override
  Future<Either<Page, GenericError>> load(int page, int total) async {
    if ((page < 1) || (page > 1 && page > total)) {
      return Right(MoviePageError());
    } else {
      return await _movieRepository.prepareMovieList(
        TrendingRequest(
          apiKey: '0ac8630bbccce79b927cbca59863ede6',
          mediaType: 'movie',
          timeWindow: 'week',
          page: page,
        ),
      );
    }
  }
}
