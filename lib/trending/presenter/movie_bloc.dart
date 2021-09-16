import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:moviestest/constants/state.dart';
import 'package:moviestest/trending/data/models/movie.dart';
import 'package:moviestest/trending/domain/errors.dart';
import 'package:moviestest/trending/domain/usecases/weekly_movies.dart';
import 'package:moviestest/trending/presenter/error/error_presenter.dart';

class MovieBloc with ChangeNotifier {
  final FilteredMovies weeklyMovies;
  final ErrorPresenter errorPresenter;
  final state = ValueNotifier<States>(States.loading);
  final List<Movie> _movies = [];
  late int _totalPages = 1;
  late int _nextPage = 1;
  late bool _over = false;
  MovieBloc(this.weeklyMovies, this.errorPresenter);

  List<Movie> get getMovies => _movies;

  bool get isOver => _over;

  Future<void> loadData() async {
    initializeDateFormatting('es');
    if (state.value != States.additionalLoading) {
      if (getMovies.isNotEmpty) state.value = States.additionalLoading;
      final data = await weeklyMovies.loadMovies(_nextPage, _totalPages);
      data.fold(
        (error) {
          if (error is MoviePageError) {
            _over = true;
            state.value = States.finished;
          }
          errorPresenter.setErrorState = error;
        },
        (page) {
          getMovies.addAll(page.movies);
          _totalPages = page.totalPages;
          _nextPage++;
          state.value = States.finished;
        },
      );
    }
  }
}
