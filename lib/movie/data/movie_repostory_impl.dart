// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:moviestest/constants/endpoints.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';
import 'package:moviestest/movie/data/models/movie.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/movie/data/movie_datasource.dart';
import 'package:moviestest/movie/domain/errors.dart';
import 'package:moviestest/movie/domain/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource _movieDatasource;

  MovieRepositoryImpl(this._movieDatasource);

  @override
  Future<Either<List<Movie>, GenericError>> prepareMovieList(
      TrendingRequest trendingRequest) async {
    try {
      final list = await _movieDatasource.getData(trendingRequest);
      const imagesPath = '${Endpoints.baseUrlImages}w500';
      final response = list.map((e) {
        e.posterPath = imagesPath + e.posterPath;
        return e;
      }).toList();
      return Left(response);
    } catch (e) {
      if (e is GenericError) {
        return Right(e);
      } else {
        return Right(MovieRepositoryError());
      }
    }
  }
}
