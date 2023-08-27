import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/home/presentation/manger/movie_cubit/movie_cubit.dart';
import 'package:movies_app/Features/home/presentation/views/widgets/newest_movies_list_view.dart';
import 'package:movies_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_indicator.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          CustomSearchTextField(
            onChanged: (value){
              BlocProvider.of<SearchCubit>(context).searchPlayers(query: value);
            },

          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: const Text(
              'Search Result',
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
  builder: (context, state) {
    if(state is SearchLoading){
      return const CustomLoadingIndicator();
    }else if(state is SearchFailure){
      return Image.asset("assets/SEARCH.png",fit:BoxFit.contain,);
    }else{
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: BlocProvider.of<SearchCubit>(context)
          .searchMovies.length,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: NewestMoviesListView(
            model: BlocProvider.of<SearchCubit>(context)
                .searchMovies[index],
            image: BlocProvider.of<SearchCubit>(context)
                .searchMovies[index]
                .posterPath,
            title: BlocProvider.of<SearchCubit>(context)
                .searchMovies[index]
                .originalTitle,
            subtitle: BlocProvider.of<SearchCubit>(context)
                .searchMovies[index]
                .overview,
            rating: BlocProvider.of<SearchCubit>(context)
                .searchMovies[index]
                .voteAverage ??
                0,
            count: BlocProvider.of<SearchCubit>(context)
                .searchMovies[index]
                .voteCount,
          ),
        );
      },
    );
    }
  },
);
  }
}
