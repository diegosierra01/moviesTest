import 'package:dartz/dartz.dart';
import 'package:moviestest/errors/errors.dart';
import 'package:moviestest/trending/data/models/page.dart';
import 'package:moviestest/trending/domain/entitties/media_type.dart';

abstract class FilteredMovies {
  Future<Either<GenericError, Page>> loadMovies(
    int currentPage,
    int? totalPages,
    MediaType mediaType,
  );

  bool isAvailablePage(int currentPage, int? totalPages) {
    const int initialPage = 1;
    if (currentPage == initialPage) {
      return true;
    } else {
      return currentPage > initialPage && currentPage <= totalPages!;
    }
  }
}
