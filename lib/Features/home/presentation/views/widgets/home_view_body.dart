import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/home/presentation/manger/movie_cubit/movie_cubit.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_indicator.dart';
import 'carousel_widget.dart';
import 'featured_movie_list_view.dart';
import 'newest_movies_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            FeaturedMoviesListView(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Newset Movies',
                style: Styles.textStyle18,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
                width: double.infinity, child: CarouselWithIndicatorDemo()),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Best Movies',
                style: Styles.textStyle18,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        )),
        SliverFillRemaining(
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return const CustomLoadingIndicator();
              } else if (state is MovieFailure) {
                return CustomErrorWidget(errMessage: state.errMessage);
              } else {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent &&
                        notification is ScrollUpdateNotification) {
                      //Future.delayed(const Duration(microseconds: 500));
                      BlocProvider.of<MovieCubit>(context).fetchMovie();
                      log('loading more...');
                    }
                    return true;
                  },
                  child: Stack(
                    children: [
                      ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount:
                        BlocProvider.of<MovieCubit>(context).movies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 30),
                            child: NewestMoviesListView(
                              model: BlocProvider.of<MovieCubit>(context)
                                  .movies[index],
                              image: BlocProvider.of<MovieCubit>(context)
                                  .movies[index]
                                  .posterPath,
                              title: BlocProvider.of<MovieCubit>(context)
                                  .movies[index]
                                  .originalTitle,
                              subtitle: BlocProvider.of<MovieCubit>(context)
                                  .movies[index]
                                  .overview,
                              rating: BlocProvider.of<MovieCubit>(context)
                                  .movies[index]
                                  .voteAverage ??
                                  0,
                              count: BlocProvider.of<MovieCubit>(context)
                                  .movies[index]
                                  .voteCount,
                            ),
                          );
                        },
                      ),
                      if (state is MoviePaginationLoading)
                        const Positioned(
                            left: 0,
                            right: 0,
                            bottom: 20,
                            child: CustomLoadingIndicator()),
                    ],
                  ),
                );
              }
            },
          ),
        ),

        // BlocBuilder<MovieCubit, MovieState>(
        //   builder: (context, state) {
        //     if (state is MovieLoading) {
        //       return const CustomLoadingIndicator();
        //     } else if (state is MovieFailure) {
        //       return CustomErrorWidget(errMessage: state.errMessage);
        //     } else {
        //       return NotificationListener<ScrollNotification>(
        //           onNotification: (notification) {
        //             if (notification.metrics.pixels ==
        //                     notification.metrics.maxScrollExtent &&
        //                 notification is ScrollUpdateNotification) {
        //               //Future.delayed(const Duration(microseconds: 500));
        //               BlocProvider.of<MovieCubit>(context).fetchMovie();
        //               log('loading more...');
        //             }
        //             return true;
        //           },
        //           child: SliverList(
        //             delegate: SliverChildBuilderDelegate(
        //               (BuildContext context, int index) {
        //                 return Padding(
        //                   padding: const EdgeInsets.symmetric(
        //                       vertical: 4, horizontal: 30),
        //                   child: NewestMoviesListView(
        //                     model: BlocProvider.of<MovieCubit>(context)
        //                         .movies[index],
        //                     image: BlocProvider.of<MovieCubit>(context)
        //                         .movies[index]
        //                         .posterPath,
        //                     title: BlocProvider.of<MovieCubit>(context)
        //                         .movies[index]
        //                         .originalTitle,
        //                     subtitle: BlocProvider.of<MovieCubit>(context)
        //                         .movies[index]
        //                         .overview,
        //                     rating: BlocProvider.of<MovieCubit>(context)
        //                             .movies[index]
        //                             .voteAverage ??
        //                         0,
        //                     count: BlocProvider.of<MovieCubit>(context)
        //                         .movies[index]
        //                         .voteCount,
        //                   ),
        //                 );
        //               },
        //               // 40 list items
        //               childCount:
        //                   BlocProvider.of<MovieCubit>(context).movies.length,
        //             ),
        //           ));
        //     }
        //   },
        // ),
      ],
    );
  }
}
