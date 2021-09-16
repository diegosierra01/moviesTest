import 'package:dartz/dartz.dart';
import 'package:moviestest/trending/data/models/trending_request.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/trending/data/trending_datasource.dart';
import 'package:moviestest/trending/domain/errors.dart';
import 'package:moviestest/trending/domain/movie_repository.dart';
import 'package:moviestest/trending/data/models/page.dart';

class MoviesPageRepository implements MovieRepository {
  final MovieDatasource _movieDatasource;

  MoviesPageRepository(this._movieDatasource);

  @override
  Future<Either<GenericError, Page>> prepareMoviesPage(
      TrendingRequest trendingRequest) async {
    try {
      final Page page = await _movieDatasource.getData(trendingRequest);
      return Right(page);
    } on GenericError catch (error) {
      return Left(error);
    } catch (error) {
      return Left(MovieRepositoryError());
    }
  }

  @override
  bool isAvailablePage(int currentPage, int totalPages) {
    const int initialPage = 1;
    return currentPage >= initialPage && currentPage <= totalPages;
  }
}
