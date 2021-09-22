import 'package:dartz/dartz.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';
import 'package:moviestest/errors/errors.dart';
import 'package:moviestest/trending/data/trending_datasource.dart';
import 'package:moviestest/trending/domain/errors.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/domain/movie_repository.dart';

class TrendingPageRepository implements TrendingRepository {
  final TrendingDatasource _trendingDatasource;

  TrendingPageRepository(this._trendingDatasource);

  @override
  Future<Either<GenericError, Page>> prepareMoviesPage(
      TrendingRequest trendingRequest) async {
    try {
      final Page page = await _trendingDatasource.getData(trendingRequest);
      return Right(page);
    } on GenericError catch (error) {
      return Left(error);
    } catch (error) {
      return Left(MovieRepositoryError());
    }
  }
}
