import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/home/data/repos/home_repo.dart';
import '../../../data/models/movie_model.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.homeRepo) : super(MovieInitial());
  List<Results>movies=[];
  final HomeRepo homeRepo;
  int currentPage=1;
  Future<void> fetchMovie() async {
    if(currentPage==1){
      emit(MovieLoading());
    }else{
      emit(MoviePaginationLoading());
    }
    var result = await homeRepo.fetchMovies(pageNumber: currentPage);
    result.fold(
        (failure) {
          if (currentPage == 1) {
            emit(MovieFailure(failure.errMessage));
          } else {
            emit(MoviePaginationFailure(failure.errMessage));
          }
        },(movies){
              currentPage++;
          this.movies.addAll(movies);
          emit(MovieSuccess());
            });
  }
}
