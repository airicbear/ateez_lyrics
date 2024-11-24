import 'package:ateez_lyrics/widgets/album_page_app_bar_background_widget.dart';
import 'package:ateez_lyrics/widgets/album_page_app_bar_title_widget.dart';
import 'package:flutter/material.dart';

class AlbumPageAppBarWidget extends StatelessWidget {
  final String albumImagePath;
  final String albumTitle;

  const AlbumPageAppBarWidget({
    super.key,
    required this.albumImagePath,
    required this.albumTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      expandedHeight: MediaQuery.of(context).size.height * 0.45,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 8.0,
        ),
        centerTitle: true,
        expandedTitleScale: 1.0,
        collapseMode: CollapseMode.pin,
        background:
            AlbumPageAppBarBackgroundWidget(albumImagePath: albumImagePath),
        title: AlbumPageAppBarTitleWidget(albumTitle: albumTitle),
      ),
      pinned: true,
    );
  }
}
