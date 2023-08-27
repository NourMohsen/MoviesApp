
import 'package:flutter/material.dart';
import 'package:movies_app/Features/home/data/models/movie_model.dart';
import 'package:movies_app/Features/home/presentation/views/widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.model});
  final Results model;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: MovieDetailsViewBody(
        model:model ,
      ),
    );
  }
}
