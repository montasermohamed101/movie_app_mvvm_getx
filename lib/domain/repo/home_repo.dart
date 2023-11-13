import 'package:dartz/dartz.dart';

import '../../data/base_error.dart';
import '../../model/movie_model.dart';
abstract class HomeRepo{

  Future<Either<BaseError,Movie>> getMovies();
}