import 'package:dartz/dartz.dart';
import 'package:moviestest/errors/errors.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';

abstract class TrendingRepository {
  Future<Either<GenericError, Page>> prepareMoviesPage(
      TrendingRequest trendingRequest);
}
