import 'package:flutter/widgets.dart';
import 'package:moviestest/errors/error_presenter.dart';
import 'package:moviestest/errors/error_widget.dart';
import 'package:provider/provider.dart';

class ErrorInjection {
  static Widget injection({required Widget child}) {
    return ChangeNotifierProvider(
      create: (context) => ErrorPresenter(),
      child: ErrorMovieWidget(child: child),
    );
  }
}
