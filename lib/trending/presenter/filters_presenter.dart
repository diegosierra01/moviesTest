import 'package:flutter/material.dart';
import 'package:moviestest/trending/data/models/media_type.dart';
import 'package:moviestest/trending/domain/media_types.dart';
import 'package:moviestest/trending/presenter/info_media_presenter.dart';

class FiltersPresenter extends ChangeNotifier {
  MediaType _mediaType = MediaTypes.instance!.defaultMediaType;
  final InfoMediaPresenter _infoMoviePresenter;

  FiltersPresenter(this._infoMoviePresenter);

  MediaType get getMediaType => _mediaType;

  set setMediaType(MediaType mediaType) {
    _mediaType = mediaType;
    notifyListeners();
    _infoMoviePresenter.loadInitialData(mediaType);
  }
}
