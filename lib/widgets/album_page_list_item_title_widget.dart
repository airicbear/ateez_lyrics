import 'package:flutter/material.dart';

class AlbumPageListItemTitleWidget extends StatelessWidget {
  final String songTitle;
  final Map<String, List<String>> songLyrics;
  final int index;

  const AlbumPageListItemTitleWidget({
    super.key,
    required this.index,
    required this.songTitle,
    required this.songLyrics,
  });

  @override
  Widget build(BuildContext context) {
    final Color? textColor = songLyrics.isEmpty
        ? Theme.of(context).disabledColor
        : Theme.of(context).textTheme.titleMedium?.color;

    final TextStyle? textStyle =
        Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            );

    return ListTile(
      leading: Text('${index + 1}'),
      title: Text(songTitle, style: textStyle),
    );
  }
}
