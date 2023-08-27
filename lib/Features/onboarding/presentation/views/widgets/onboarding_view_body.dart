import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/Features/onboarding/data/onboarding_model.dart';
import 'package:movies_app/Features/onboarding/presentation/views/widgets/default_text_button.dart';
import 'package:movies_app/Features/onboarding/presentation/views/widgets/onboarding_item.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/Page.png',
      title: 'Watch on any device',
      body: 'Stream on your phone, tablet, laptop, and TV without paying more.',
    ),
    BoardingModel(
      image: 'assets/page2.png',
      title: '3, 2, 1... Download!',
      body: 'Always have something to watch offline.',
    ),
    BoardingModel(
      image: 'assets/page3.png',
      title: 'Unlimited entertainment.',
      body: 'Stream and download as much as you want, no extra fees.',
    ),
  ];
   bool isLast = false;
  // void submit() {
  //   CacheHelper.setData(key: "onBoarding", value: true).then((value) {
  //     if (value = true) {
  //       navigateAndFinish(context,ShopLoginScreen());
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/mask/feshar.jpg",),fit: BoxFit.cover)
            ),
            child: Container(
              color: Colors.black.withOpacity(.5),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: boardController,
                        onPageChanged: (int index) {
                          if (index == boarding.length - 1) {
                            setState(() {
                              isLast = true;
                            });
                          } else {
                            setState(() {
                              isLast = false;
                            });
                          }
                        },
                        itemBuilder: (context, index) =>
                        OnboardingItem(model:boarding[index]),
                        itemCount: boarding.length,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      children: [
                        SmoothPageIndicator(
                          controller: boardController,
                          effect: const ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.white,
                            dotHeight: 10,
                            expansionFactor: 4,
                            dotWidth: 10,
                            spacing: 5.0,
                          ),
                          count: boarding.length,
                        ),
                        const Spacer(),
                        FloatingActionButton(
                          onPressed: () {
                            if (isLast) {
                              //submit();
                            } else {
                              boardController.nextPage(
                                duration: const Duration(
                                  milliseconds: 750,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
              right: 10,
              child:DefaultTextButton(text: "skip",function: (){
                GoRouter.of(context).push(AppRouter.kHomeView);
              },)
          )
        ],
      ),
    );
  }
}
