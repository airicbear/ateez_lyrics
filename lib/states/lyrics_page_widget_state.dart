import 'package:ateez_lyrics/widgets/lyrics_page_app_bar_widget.dart';
import 'package:ateez_lyrics/widgets/lyrics_page_bottom_navigation_bar_widget.dart';
import 'package:ateez_lyrics/widgets/lyrics_page_lyrics_list_widget.dart';
import 'package:ateez_lyrics/widgets/lyrics_page_widget.dart';
import 'package:flutter/material.dart';

class LyricsPageWidgetState extends State<LyricsPageWidget>
    with SingleTickerProviderStateMixin {
  late List<String> lyricsList;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: widget.songLyrics.length,
      vsync: this,
    );

    // Update lyrics on tab select
    tabController.addListener(() {
      setState(() {
        lyricsList = widget.songLyrics.values.toList()[tabController.index];
      });
    });

    // Initial lyrics state
    lyricsList = widget.songLyrics.entries.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: LyricsPageBottomNavigationBarWidget(
        songLyrics: widget.songLyrics,
        tabController: tabController,
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            LyricsPageAppBarWidget(
              imagePath: widget.albumImagePath,
              songTitle: widget.songTitle,
            ),
            LyricsPageLyricsListWidget(lyrics: lyricsList),
          ],
        ),
      ),
    );
  }
}
