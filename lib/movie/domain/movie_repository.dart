// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/movie/data/models/movie.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';

abstract class MovieRepository {
  Future<Either<List<Movie>, GenericError>> prepareMovieList(
      TrendingRequest trendingRequest);
}
