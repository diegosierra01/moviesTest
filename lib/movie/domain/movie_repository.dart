import 'package:dartz/dartz.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/movie/data/models/page.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';

abstract class MovieRepository {
  Future<Either<Page, GenericError>> prepareMovieList(
      TrendingRequest trendingRequest);
}
