import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moviestest/trending/data/movie_dio_datasource.dart';
import 'package:moviestest/trending/data/trending_datasource.dart';
import 'package:moviestest/trending/domain/movie_repository.dart';
import 'package:moviestest/trending/domain/trending_repository_impl.dart';
import 'package:moviestest/trending/domain/usecases/weekly_movies.dart';

class Injection {
  static final serviceLocator = GetIt.instance;

  static void setupLocator() {
    serviceLocator.registerLazySingleton<Dio>(() => Dio());
    serviceLocator.registerLazySingleton<TrendingDatasource>(
      () => TrendingDioDatasource(
        serviceLocator(),
        Options(
          followRedirects: false,
          validateStatus: (status) => status! < 510,
        ),
      ),
    );
    serviceLocator.registerLazySingleton<TrendingRepository>(
      () => TrendingPageRepository(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<FilteredMovies>(
      () => WeeklyMoviesImpl(serviceLocator()),
    );
  }
}
