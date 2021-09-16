import 'package:flutter/widgets.dart';
import 'package:moviestest/trending/presenter/error/error_presenter.dart';
import 'package:provider/provider.dart';
import 'package:moviestest/trending/presenter/error/error_widget.dart';

class ErrorInjection {
  static Widget injection({required Widget child}) {
    return ChangeNotifierProvider(
      create: (context) => ErrorPresenter(),
      child: ErrorMovieWidget(child: child),
    );
  }
}
