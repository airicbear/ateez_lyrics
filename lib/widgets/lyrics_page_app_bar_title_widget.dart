import 'package:flutter/material.dart';

class LyricsPageAppBarTitleWidget extends StatelessWidget {
  final String songTitle;
  final bool isExpanded;

  const LyricsPageAppBarTitleWidget({
    super.key,
    required this.songTitle,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            );

    return Text(
      songTitle,
      style: textStyle,
      maxLines: isExpanded ? 2 : 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
