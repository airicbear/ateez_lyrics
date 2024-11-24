import 'package:ateez_lyrics/widgets/lyrics_page_widget.dart';
import 'package:flutter/material.dart';

void openLyricsPageWidget(
  BuildContext context,
  String imagePath,
  String songTitle,
  Map<String, List<String>> songLyrics,
) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => LyricsPageWidget(
        albumImagePath: imagePath,
        songTitle: songTitle,
        songLyrics: songLyrics,
      ),
    ),
  );
}
