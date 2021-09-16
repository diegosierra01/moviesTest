import 'package:dartz/dartz.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';

abstract class MovieRepository {
  Future<Either<GenericError, Page>> prepareMoviesPage(
      TrendingRequest trendingRequest);
  bool isAvailablePage(int currentPage, int totalPages);
}
