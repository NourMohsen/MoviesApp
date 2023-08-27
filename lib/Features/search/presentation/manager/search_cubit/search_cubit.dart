import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/home/data/models/movie_model.dart';
import '../../../../home/data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;
  SearchCubit(this.homeRepo) : super(SearchInitial());
  List<Results>searchMovies=[];
  Future<void> searchPlayers({required String query}) async {
    emit(SearchLoading());
    searchMovies.clear();
    var result = await homeRepo.searchMovies(query: query);
    result.fold((failure) {emit(SearchFailure(failure.errMessage));},
            (searchPlayers){
      searchMovies.addAll(searchPlayers);
      emit(SearchSuccess());});
  }

}
