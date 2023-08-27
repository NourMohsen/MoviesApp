import 'package:flutter/material.dart';
import 'package:movies_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:movies_app/Features/home/presentation/views/home_view.dart';
import 'package:movies_app/core/utils/app_router.dart';

import 'Features/home/presentation/views/movie_details_view.dart';

void main() {
  runApp(const MoviesApp());
}
class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        //   textTheme:
        //       // GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      title: "Movies App",
      debugShowCheckedModeBanner: false,
        routerConfig:AppRouter.router ,
        );
  }
}
