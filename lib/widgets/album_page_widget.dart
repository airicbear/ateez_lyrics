import 'package:ateez_lyrics/model/album_model.dart';
import 'package:ateez_lyrics/widgets/album_page_app_bar_widget.dart';
import 'package:ateez_lyrics/widgets/album_page_list_widget.dart';
import 'package:flutter/material.dart';

class AlbumPageWidget extends StatelessWidget {
  final AlbumModel album;

  const AlbumPageWidget({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            AlbumPageAppBarWidget(
              albumImagePath: album.albumImagePath,
              albumTitle: album.albumTitle,
            ),
            const SliverToBoxAdapter(
              child: Padding(padding: EdgeInsets.all(2.0)),
            ),
            AlbumPageListWidget(
              albumImagePath: album.albumImagePath,
              albumLyricsFolderPath: album.albumLyricsFolderPath,
              albumLyricsPaths: album.albumLyricsPaths,
            ),
          ],
        ),
      ),
    );
  }
}
