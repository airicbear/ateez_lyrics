import 'package:ateez_lyrics/states/lyrics_page_bottom_navigation_bar_widget_state.dart';
import 'package:flutter/material.dart';

class LyricsPageBottomNavigationBarWidget extends StatefulWidget {
  final Map<String, List<String>> songLyrics;
  final TabController tabController;

  const LyricsPageBottomNavigationBarWidget({
    super.key,
    required this.songLyrics,
    required this.tabController,
  });

  @override
  State<StatefulWidget> createState() =>
      LyricsPageBottomNavigationBarWidgetState();
}
