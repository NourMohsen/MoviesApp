import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 50,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 7.0,
              color: Colors.white,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: AnimatedTextKit(
           isRepeatingAnimation: true,
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText('Movie App'),
          ],
        ),
      ),
    ),
     const SizedBox(
       height: 4,
     ),
     AnimatedTextKit(
       displayFullTextOnTap: true,
     animatedTexts: [
     WavyAnimatedText('Watch anywhere. Cancel anytime.'),
     ],

     )],
    );
  }
}
