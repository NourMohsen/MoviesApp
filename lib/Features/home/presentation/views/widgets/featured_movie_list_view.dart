import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'masked_image.dart';

class FeaturedMoviesListView extends StatelessWidget {
  const FeaturedMoviesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: ((context, index) {
          String mask;
          if (index == 0) {
            mask = kMaskFirstIndex;
            //} else if (index == newMovies.length - 1) {
          } else if (index == 9) {

            mask = kMaskLastIndex;
          } else {
            mask = kMaskCenter;
          }
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              height: 160,
              width: 142,
              child: MaskedImage(
                asset: 'https://m.media-amazon.com/images/M/MV5BODg3MzYwMjE4N15BMl5BanBnXkFtZTcwMjU5NzAzNw@@._V1_.jpg',
                mask: mask,
                isAsset: false,
              ),
            ),
          );
        }),
      ),
    );
  }
}
