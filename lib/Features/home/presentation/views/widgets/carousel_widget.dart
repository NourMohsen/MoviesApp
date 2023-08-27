import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/home/presentation/manger/movie_cubit/movie_cubit.dart';
import 'package:movies_app/Features/home/presentation/views/widgets/custom_movie_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

 List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
//
// final List<Widget> imageSliders = imgList
//     .map((item) => Container(
//   child: Container(
//     margin: EdgeInsets.all(5.0),
//     child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Stack(
//           children: <Widget>[
//             Image.network(item, fit: BoxFit.cover, width: 1000.0),
//           ],
//         )),
//   ),
// ))
//     .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key,});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieCubit, MovieState>(
  builder: (context, state) {
      if(state is MovieLoading){
        return const CustomLoadingIndicator();
      } else if(state is MovieFailure){
        return CustomErrorWidget(errMessage: state.errMessage);
      }else {
    return Stack(children: [
      CarouselSlider.builder(
        itemCount: 6,
        //BlocProvider.of<MovieCubit>(context).movies.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: <Widget>[
                    Container(
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                              BlocProvider.of<MovieCubit>(context).movies[itemIndex].posterPath,
                              fit: BoxFit.fill, width: 1000.0),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black38,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [.7, 1]),
                            ),
                          )
                        ],
                      )),
                ),
              )
                      ],
                    )),
              ),
            ),
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2/.75,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Positioned(
        bottom: 10,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:List.generate(6, (index) => GestureDetector(
    onTap: () => _controller.animateToPage(index),
    child: Container(
    width: 12.0,
    height: 12.0,
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: (Theme.of(context).brightness == Brightness.dark
    ? Colors.white
        : Colors.black)
        .withOpacity(_current == index ? 0.9 : 0.4)),
    ),
    )
    )


          // imgList.asMap().entries.map((entry) {
          // }).toList(),
        )
      ),
    ]);
      }
  },
);
  }
}
