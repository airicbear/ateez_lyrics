import 'package:ateez_lyrics/states/lyrics_page_widget_state.dart';
import 'package:flutter/material.dart';

class LyricsPageWidget extends StatefulWidget {
  final String albumImagePath;
  final String songTitle;
  final Map<String, List<String>> songLyrics;

  const LyricsPageWidget({
    super.key,
    required this.albumImagePath,
    required this.songTitle,
    required this.songLyrics,
  });

  @override
  State<StatefulWidget> createState() => LyricsPageWidgetState();
}
