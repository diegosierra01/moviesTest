// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviestest/constants/endpoints.dart';
import 'package:moviestest/movie/data/models/trendingRequest.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/movie/data/movie_datasource.dart';
import 'package:moviestest/movie/domain/errors.dart';
import 'package:moviestest/movie/domain/movie_repository.dart';

import 'models/page.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource _movieDatasource;

  MovieRepositoryImpl(this._movieDatasource);

  @override
  Future<Either<Page, GenericError>> prepareMovieList(
      TrendingRequest trendingRequest) async {
    try {
      final page = await _movieDatasource.getData(trendingRequest);
      const imagesPath = '${Endpoints.baseUrlImages}w500';
      page.movies = page.movies.map((e) {
        e.posterPath = imagesPath + e.posterPath;
        return e;
      }).toList();
      return Left(page);
    } on GenericError catch (err) {
      return Right(err);
    } catch (err) {
      return Right(MovieRepositoryError());
    }
  }
}
