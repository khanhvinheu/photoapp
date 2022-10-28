import 'package:flutter/material.dart';

class ProgressIndicatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          semanticsLabel: 'Circular progress indicator',
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Vui lòng đợi!',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
