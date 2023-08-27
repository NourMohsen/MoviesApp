part of 'movie_cubit.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}
class MovieLoading extends MovieState {}
class MovieSuccess extends MovieState {}
class MovieFailure extends MovieState {
  final String errMessage;
  MovieFailure(this.errMessage);
}
class MoviePaginationLoading extends MovieState {}
class MoviePaginationFailure extends MovieState {
  final String errMessage;
  MoviePaginationFailure(this.errMessage);
}
