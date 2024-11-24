import 'package:ateez_lyrics/widgets/lyrics_page_bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class LyricsPageBottomNavigationBarWidgetState
    extends State<LyricsPageBottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    final Map(:length, :keys) = widget.songLyrics;
    final labelStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
          fontWeight: FontWeight.bold,
        );

    return widget.songLyrics.length > 1
        ? SafeArea(
            child: TabBar(
              controller: widget.tabController,
              tabs: List<Tab>.generate(
                length,
                (index) {
                  final language = keys.toList()[index];

                  return Tab(text: language.toUpperCase());
                },
              ),
              labelStyle: labelStyle,
            ),
          )
        : const SizedBox.shrink();
  }
}
