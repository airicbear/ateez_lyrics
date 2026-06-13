import 'package:ateez_lyrics/widgets/lyrics_page_app_bar_background_widget.dart';
import 'package:ateez_lyrics/widgets/lyrics_page_app_bar_title_widget.dart';
import 'package:flutter/material.dart';

class LyricsPageAppBarWidget extends StatelessWidget {
  final String songTitle;
  final String imagePath;
  final List<Widget>? actions;

  const LyricsPageAppBarWidget({
    super.key,
    required this.songTitle,
    required this.imagePath,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final expandedHeight = MediaQuery.of(context).size.height * 0.3;
    final titlePadding = const EdgeInsetsDirectional.only(
      start: 72,
      bottom: 16,
      end: 16,
    );

    return SliverAppBar(
      expandedHeight: expandedHeight,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isExpanded = constraints.maxHeight * 0.3 > kToolbarHeight;

          return FlexibleSpaceBar(
            titlePadding: titlePadding,
            centerTitle: false,
            background: LyricsPageAppBarBackgroundWidget(imagePath: imagePath),
            title: LyricsPageAppBarTitleWidget(
              songTitle: songTitle,
              isExpanded: isExpanded,
            ),
          );
        },
      ),
      pinned: true,
      actions: actions,
    );
  }
}
