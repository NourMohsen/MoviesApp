import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:movies_app/Features/home/presentation/manger/movie_cubit/movie_cubit.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(HomeRepoImpl(ApiService(Dio())))..fetchMovie(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Movies App"),
        actions: [
          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.kSearchView);
          }, icon: const Icon(Icons.search))
        ],
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
