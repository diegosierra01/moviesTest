import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:moviestest/movie/data/movie_datasource.dart';
import 'package:moviestest/movie/data/movie_repostory_impl.dart';
import 'package:moviestest/movie/domain/movie_repository.dart';
import 'package:moviestest/movie/domain/usecases/weeklyMovies.dart';
import 'package:moviestest/movie/external/movie_datasource_impl.dart';
import 'package:moviestest/movie/presenter/movie_bloc.dart';
import 'package:moviestest/movie/presenter/movie_page.dart';
import 'package:provider/provider.dart';

class MovieInjection {
  static Widget injection() {
    return MultiProvider(
      providers: [
        Provider<Dio>(
          create: (context) => Dio(),
        ),
        Provider<MovieDatasource>(
          create: (context) => MovieDatasourceImpl(
            context.read<Dio>(),
            Options(
              followRedirects: false,
              validateStatus: (status) => status! < 510,
            ),
          ),
        ),
        Provider<MovieRepository>(
          create: (context) => MovieRepositoryImpl(
            context.read<MovieDatasource>(),
          ),
        ),
        Provider<WeeklyMovies>(
          create: (context) => WeeklyMoviesImpl(
            context.read<MovieRepository>(),
          ),
        ),
        ChangeNotifierProvider<MovieBloc>(
          create: (context) => MovieBloc(
            context.read<WeeklyMovies>(),
          )..loadData(),
        )
      ],
      child: MoviePage(),
    );
  }
}
