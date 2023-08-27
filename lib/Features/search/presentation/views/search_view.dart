import 'package:flutter/material.dart';
import 'package:movies_app/Features/search/presentation/views/widgets/search_view_body.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}
