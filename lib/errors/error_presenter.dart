import 'package:flutter/material.dart';
import 'package:moviestest/errors/errors.dart';

class ErrorPresenter extends ChangeNotifier {
  GenericError _errorState = NoError();

  GenericError get getErrorState => _errorState;

  set setErrorState(GenericError errorState) {
    _errorState = errorState;
    if (getErrorState is! NoError) notifyListeners();
  }

  late Icon _iconError;

  Icon get getIcon => _iconError;

  set setIconError(Icon iconError) => _iconError = iconError;

  late String _messageError;

  String get getMessageError => _messageError;

  set setMessageError(String stringError) => _messageError = stringError;

  void assignErrorInfo(Color colorError) {
    switch (getErrorState.runtimeType) {
      case InternetError:
        setMessageError =
            'En este momento no tienes acceso a internet. Activa los datos del dispositivo o conéctate a una red Wifi.';
        setIconError = Icon(
          Icons.power_off_outlined,
          color: colorError,
        );
        break;
      case ServerError:
        setMessageError =
            'En este momento no se puede conectar con el servidor. Intenta de nuevo mas tarde.';
        setIconError = Icon(
          Icons.cloud_off,
          color: colorError,
        );
        break;
      default:
        setMessageError =
            'Ha ocurrido un error inesperado, trabajamos constantemente para minimizar estos fallos.';
        setIconError = Icon(
          Icons.error_outline,
          color: colorError,
        );
    }
  }
}
