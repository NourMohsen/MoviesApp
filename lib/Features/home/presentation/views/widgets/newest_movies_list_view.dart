import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/Features/home/presentation/views/widgets/custom_movie_item.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/styles.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../data/models/movie_model.dart';
import 'movie_rating.dart';

class NewestMoviesListView extends StatelessWidget {
  const NewestMoviesListView({
    super.key, required this.title, required this.subtitle, required this.image, required this.rating, required this.count, required this.model,
  });
final String title,subtitle,image;
final double rating;
final int count;
final Results model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kMovieDetailsView,
          extra: model,
        );
      },
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            // Container(
            //   height: 160,
            //   width: 110,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     image: DecorationImage(image: NetworkImage(image))
            //   ),
            // ),
            CustomMovieImage(imageUrl: image),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),

                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14,
                  ),

                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating:rating,
                        count: count,
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
