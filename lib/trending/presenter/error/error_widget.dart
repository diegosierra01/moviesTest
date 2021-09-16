import 'package:flutter/material.dart';
import 'package:moviestest/constants/errors.dart';
import 'package:moviestest/error_dialog.dart';
import 'package:moviestest/trending/presenter/error/error_presenter.dart';
import 'package:provider/provider.dart';

class ErrorMovieWidget extends StatelessWidget with WidgetsBindingObserver {
  final Widget child;

  const ErrorMovieWidget({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _errorPresenter = Provider.of<ErrorPresenter>(context);
    if (_errorPresenter.getErrorState is! NoError) {
      _errorPresenter.assignErrorInfo(
        Theme.of(context).primaryColor,
      );
      WidgetsBinding.instance!
        ..addObserver(this)
        ..addPostFrameCallback(
          (_) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) => ErrorDialog(
                icon: _errorPresenter.getIcon,
                message: _errorPresenter.getMessageError,
              ),
            ).then<void>((value) {
              _errorPresenter.setErrorState = NoError();
            });
          },
        );
    }
    return child;
  }
}
