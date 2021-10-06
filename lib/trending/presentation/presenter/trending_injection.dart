import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:moviestest/errors/error_presenter.dart';
import 'package:moviestest/injection.dart';
import 'package:moviestest/trending/data/datasource/trending_datasource.dart';
import 'package:moviestest/trending/data/trending_repository_impl.dart';
import 'package:moviestest/trending/domain/movie_repository.dart';
import 'package:moviestest/trending/domain/entitties/media_types.dart';
import 'package:moviestest/trending/domain/usecases/filtered_movies.dart';
import 'package:moviestest/trending/domain/usecases/weekly_movies_impl.dart';
import 'package:moviestest/trending/presentation/presenter/filters_presenter.dart';
import 'package:moviestest/trending/presentation/presenter/info_media_presenter.dart';
import 'package:moviestest/trending/presentation/presenter/media_layout_presenter.dart';
import 'package:moviestest/trending/presentation/ui/widgets/trending_content.dart';
import 'package:provider/provider.dart';

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
