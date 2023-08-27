import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/Features/home/presentation/views/widgets/video_player.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/styles.dart';
import '../../../data/models/movie_model.dart';
import 'masked_image.dart';
class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key, required this.model});
final Results model;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          expandedHeight: 400,
          stretch: true,
          snap: false,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(model.posterPath,fit: BoxFit.fill,),
            centerTitle: true,
            title: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayVideoPage()));
              },
              child: Container(
                color: Colors.black.withOpacity(.5),
                child: Text(model.originalTitle,
                    style: Styles.textStyle16
                ),
              ),
            ), //Text
          ), //FlexibleSpaceBar
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back Button',
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ), //IconButton
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: () {},
            ),
          ], //<Widget>[]
        ), //SliverAppBar
        SliverList(delegate: SliverChildListDelegate(
          [
            const SizedBox(
              height: 16,
            ),
            Text(
              '2021•Action-Adventure-Fantasy•2h36m',
              textAlign: TextAlign.center,
              style: Styles.textStyle18.copyWith(
                color: kWhiteColor.withOpacity(
                  0.75,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: RatingBar.builder(
                itemSize: 24,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding:
                const EdgeInsets.symmetric(horizontal: 1),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: kYellowColor,
                ),
                onRatingUpdate: (rating) {
                  debugPrint(rating.toString());
                },
                unratedColor:kWhiteColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                model.overview,
                textAlign: TextAlign.center,
                maxLines: 5,
                style: Styles.textStyle16.copyWith(
                  color: kWhiteColor.withOpacity(
                    0.75,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Divider(
                thickness: 2,
                color: kWhiteColor.withOpacity(0.15),
              ),
            ),
            Text(
              'Casts',
              textAlign: TextAlign.center,
              style: Styles.textStyle20.copyWith(
                color: kWhiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
           const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 560,
              child:
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  childAspectRatio: 7/2,
                  crossAxisSpacing: 20

                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context,index)=> Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      minRadius: 16,
                      maxRadius: 25,
                      backgroundImage: const NetworkImage(
                        'https://m.media-amazon.com/images/M/MV5BODg3MzYwMjE4N15BMl5BanBnXkFtZTcwMjU5NzAzNw@@._V1_.jpg',
                      ),
                    ),
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: 40,
                          maxWidth: 112,
                        ),
                        transform:
                        Matrix4.translationValues(-6, 0, 0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: const [
                            MaskedImage(
                              asset:kMaskCast,
                              mask: kMaskCast,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Angelina Jolie',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ))
      ], //<Widget>[]
    );
  }
}
