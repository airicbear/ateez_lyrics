import 'package:ateez_lyrics/widgets/lyrics_page_lyrics_list_item_widget.dart';
import 'package:flutter/material.dart';

class LyricsPageLyricsListWidget extends StatelessWidget {
  final List<String> lyrics;

  const LyricsPageLyricsListWidget({
    super.key,
    required this.lyrics,
  });

  @override
  Widget build(BuildContext context) {
    final List(:length) = lyrics;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final String line = lyrics[index];

          return LyricsPageLyricsListItemWidget(
            lyricLine: line,
          );
        },
        childCount: length,
      ),
    );
  }
}
