import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/Features/home/data/models/movie_model.dart';
import 'package:movies_app/core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Results>>> fetchMovies({required int pageNumber}) async{
    try {
          var data = await apiService.get(endPoint:"discover/movie?page=$pageNumber&",);
          List<Results> movies = [];
          var model = MovieModel.fromJson(data);
          movies.addAll(model.results);
          // //var item = (data['results']as List)[0];
          // for (var item in data['results']) {
          //     movies.add(MovieModel(title: item["original_title"], subtitle: item["overview"], image: "http://image.tmdb.org/t/p/original${item["poster_path"]}"));
          // }
          log(movies.toString(),name: "data");

          return right(movies);
        } catch (e) {
          if (e is DioException) {
            return left(
              ServerFailure.fromDioError(e),
            );
          }
          return left(
            ServerFailure(
              e.toString(),
            ),
          );
        }
  }
  @override
  Future<Either<Failure, List<Results>>> searchMovies({required String query})async {
    try {
      var data = await apiService.get(
          endPoint:
          "search/movie?query=$query&");
      List<Results> search = [];
      var model = MovieModel.fromJson(data);
      search.addAll(model.results);
      log(data.toString(),name: "search");

      return right(search);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
