import 'package:moviestest/errors/errors.dart';

abstract class MovieError implements GenericError {}

class MovieDatasourceError implements MovieError {}

class MovieRepositoryError implements MovieError {}

class MovieLastPageError implements MovieError {}
