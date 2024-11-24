import 'package:ateez_lyrics/model/song_model.dart';
import 'package:ateez_lyrics/singletons/song_manager_singleton.dart';
import 'package:ateez_lyrics/utils/get_song_full_path_util.dart';
import 'package:ateez_lyrics/utils/open_lyrics_page_widget_util.dart';
import 'package:ateez_lyrics/widgets/album_page_list_item_error_widget.dart';
import 'package:ateez_lyrics/widgets/album_page_list_item_title_widget.dart';
import 'package:flutter/material.dart';

class AlbumPageListItemWidget extends StatelessWidget {
  final String albumLyricsFolderPath;
  final List<String> albumLyricsPaths;
  final String albumImagePath;
  final int index;

  const AlbumPageListItemWidget({
    super.key,
    required this.index,
    required this.albumLyricsFolderPath,
    required this.albumLyricsPaths,
    required this.albumImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, SongModel> allSongs = SongManager().songs;
    final String path = getSongFullPath(
      albumLyricsFolderPath,
      albumLyricsPaths[index],
    );

    if (!allSongs.containsKey(path)) return AlbumPageListItemErrorWidget();

    final SongModel song = allSongs[path]!;

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          if (song.songLyrics.isNotEmpty) {
            openLyricsPageWidget(
              context,
              albumImagePath,
              song.songTitle,
              song.songLyrics,
            );
          }
        },
        child: AlbumPageListItemTitleWidget(
          index: index,
          songTitle: song.songTitle,
          songLyrics: song.songLyrics,
        ),
      ),
    );
  }
}
