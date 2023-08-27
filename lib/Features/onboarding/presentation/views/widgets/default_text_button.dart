import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({super.key, this.function, required this.text});
  final Function()? function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
        onPressed: function,
        child: Text(text.toUpperCase(),style: Styles.textStyle20,));
  }
}
