import 'package:moviestest/constants/errors.dart';

abstract class MovieError implements GenericError {}

class MovieDatasourceError implements MovieError {}
