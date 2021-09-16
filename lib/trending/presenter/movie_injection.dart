import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:moviestest/trending/data/trending_datasource.dart';
import 'package:moviestest/trending/data/trending_repository_impl.dart';
import 'package:moviestest/trending/domain/movie_repository.dart';
import 'package:moviestest/trending/domain/usecases/weekly_movies.dart';
import 'package:moviestest/trending/external/movie_dio_datasource.dart';
import 'package:moviestest/trending/presenter/error/error_presenter.dart';
import 'package:moviestest/trending/presenter/layout/movies_layout_presenter.dart';
import 'package:moviestest/trending/presenter/movie_bloc.dart';
import 'package:moviestest/trending/presenter/movies_content.dart';
import 'package:provider/provider.dart';

class MovieInjection {
  static Widget injection() {
    return MultiProvider(
      providers: [
        Provider<Dio>(
          create: (context) => Dio(),
        ),
        Provider<MovieDatasource>(
          create: (context) => MovieDioDatasource(
            context.read<Dio>(),
            Options(
              followRedirects: false,
              validateStatus: (status) => status! < 510,
            ),
          )..start(),
        ),
        Provider<MovieRepository>(
          create: (context) => MoviesPageRepository(
            context.read<MovieDatasource>(),
          ),
        ),
        Provider<FilteredMovies>(
          create: (context) => WeeklyMoviesImpl(
            context.read<MovieRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => MoviesLayoutPresenter(),
        ),
        ChangeNotifierProvider<MovieBloc>(
          create: (context) => MovieBloc(
            context.read<FilteredMovies>(),
            context.read<ErrorPresenter>(),
          )..loadData(),
        ),
      ],
      child: const MoviesContent(),
    );
  }
}
