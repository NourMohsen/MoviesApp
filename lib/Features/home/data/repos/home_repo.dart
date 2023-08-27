import 'package:dartz/dartz.dart';
import 'package:movies_app/Features/home/data/models/movie_model.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Results>>> fetchMovies({required int pageNumber});
  Future<Either<Failure, List<Results>>> searchMovies({required String query});
 }
