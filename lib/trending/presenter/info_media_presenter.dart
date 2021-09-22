import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:moviestest/errors/error_presenter.dart';
import 'package:moviestest/trending/data/models/media.dart';
import 'package:moviestest/trending/data/models/media_type.dart';
import 'package:moviestest/trending/domain/errors.dart';
import 'package:moviestest/trending/domain/usecases/weekly_movies.dart';
import 'package:moviestest/trending/presenter/info_media_state.dart';

class InfoMediaPresenter with ChangeNotifier {
  final FilteredMovies weeklyMovies;
  final ErrorPresenter errorPresenter;
  final List<Media> _mediaList = [];
  MediaState _state = MediaState.loading;
  late int _totalPages;
  late int _nextPage;
  late bool _over;
  InfoMediaPresenter(this.weeklyMovies, this.errorPresenter);

  List<Media> get getMediaList => _mediaList;

  MediaState get getMediaState => _state;

  set setMediaState(MediaState state) {
    _state = state;
    notifyListeners();
  }

  bool requireProgressIndicator(int indexMedia) {
    return indexMedia == getMediaList.length &&
        !_over &&
        getMediaState == MediaState.additionalLoading;
  }

  Future<void> loadInitialData(MediaType mediaType) async {
    initializeDateFormatting('es');
    _nextPage = 1;
    _over = false;
    getMediaList.clear();
    setMediaState = MediaState.loading;
    loadData(mediaType, null);
  }

  Future<void> loadAdditionalData(MediaType mediaType) async {
    if (getMediaState != MediaState.additionalLoading) {
      setMediaState = MediaState.additionalLoading;
      loadData(mediaType, _totalPages);
    }
  }

  Future<void> loadData(MediaType mediaType, int? totalPages) async {
    final data =
        await weeklyMovies.loadMovies(_nextPage, totalPages, mediaType);
    data.fold(
      (error) {
        if (error is MovieLastPageError) {
          _over = true;
          setMediaState = MediaState.finished;
        }
        errorPresenter.setErrorState = error;
      },
      (page) {
        getMediaList.addAll(page.movies);
        _totalPages = page.totalPages;
        _nextPage++;
        setMediaState = MediaState.finished;
      },
    );
  }
}
