import 'package:ateez_lyrics/widgets/album_page_list_item_widget.dart';
import 'package:flutter/material.dart';

class AlbumPageListWidget extends StatelessWidget {
  final String albumImagePath;
  final List<String> albumLyricsPaths;
  final String albumLyricsFolderPath;

  const AlbumPageListWidget({
    super.key,
    required this.albumImagePath,
    required this.albumLyricsPaths,
    required this.albumLyricsFolderPath,
  });

  @override
  Widget build(BuildContext context) {
    final List(:length) = albumLyricsPaths;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => AlbumPageListItemWidget(
            albumImagePath: albumImagePath,
            albumLyricsFolderPath: albumLyricsFolderPath,
            albumLyricsPaths: albumLyricsPaths,
            index: index,
          ),
          childCount: length,
        ),
      ),
    );
  }
}
