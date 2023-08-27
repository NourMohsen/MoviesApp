import 'package:flutter/material.dart';
import 'package:movies_app/Features/onboarding/data/onboarding_model.dart';
import 'package:movies_app/core/utils/styles.dart';
class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.model});
  final BoardingModel model;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.title,
          style:Styles.textStyle14.copyWith(
            fontSize: 24.0,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          model.body,
          style: Styles.textStyle14.copyWith(
            fontSize: 14.0,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
