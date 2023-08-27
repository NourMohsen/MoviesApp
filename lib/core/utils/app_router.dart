import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:movies_app/Features/home/presentation/views/movie_details_view.dart';
import 'package:movies_app/Features/onboarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:movies_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/core/utils/api_service.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/home/data/models/movie_model.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kMovieDetailsView = '/movieDetailsView';
  static const kSearchView = '/searchView';
  static const kOnBoardingScreenView="/onBoardingScreen";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context)=>SearchCubit(HomeRepoImpl(ApiService(Dio()))),
            child: const SearchView()),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kOnBoardingScreenView,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: kMovieDetailsView,
        builder: (context, state) =>  MovieDetailsView(
            model: state.extra as Results,
          ),
        ),
    ],
  );
}
