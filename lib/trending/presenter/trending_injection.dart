import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:moviestest/errors/error_presenter.dart';
import 'package:moviestest/injection.dart';
import 'package:moviestest/trending/data/trending_datasource.dart';
import 'package:moviestest/trending/domain/trending_repository_impl.dart';
import 'package:moviestest/trending/domain/movie_repository.dart';
import 'package:moviestest/trending/domain/media_types.dart';
import 'package:moviestest/trending/domain/usecases/weekly_movies.dart';
import 'package:moviestest/trending/data/movie_dio_datasource.dart';
import 'package:moviestest/trending/presenter/info_media_presenter.dart';
import 'package:moviestest/trending/presenter/media_layout_presenter.dart';
import 'package:moviestest/trending/ui/widgets/trending_content.dart';
import 'package:provider/provider.dart';
import 'package:moviestest/trending/presenter/filters_presenter.dart';

class TrendingInjection {
  static Widget injection() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InfoMediaPresenter>(
          create: (context) => InfoMediaPresenter(
            Injection.serviceLocator<FilteredMovies>(),
            context.read<ErrorPresenter>(),
          )..loadInitialData(
              MediaTypes.instance!.defaultMediaType,
            ),
        ),
        ChangeNotifierProvider<FiltersPresenter>(
          create: (context) => FiltersPresenter(
            context.read<InfoMediaPresenter>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => MoviesLayoutPresenter(),
        ),
      ],
      child: const MoviesContent(),
    );
  }
}
