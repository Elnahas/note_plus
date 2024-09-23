import 'package:flutter/material.dart';

class AppLabelText extends StatelessWidget {

  final String labelText;
  const AppLabelText({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Text(
            labelText,
            style: Theme.of(context).textTheme.displayMedium,
          );
  }
}