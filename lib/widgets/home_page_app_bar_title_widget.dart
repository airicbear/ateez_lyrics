import 'package:flutter/material.dart';

class HomePageAppBarTitleWidget extends StatelessWidget {
  const HomePageAppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        );

    return Text(
      'ATEEZ Lyrics',
      style: textStyle,
    );
  }
}
