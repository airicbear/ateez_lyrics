import 'package:ateez_lyrics/model/song_model.dart';
import 'package:ateez_lyrics/model/song_query_item_model.dart';
import 'package:ateez_lyrics/singletons/song_manager_singleton.dart';
import 'package:ateez_lyrics/utils/find_songs_with_string_util.dart';
import 'package:ateez_lyrics/utils/get_song_full_path_util.dart';
import 'package:ateez_lyrics/widgets/search_query_result_list_item_widget.dart';
import 'package:flutter/material.dart';

Iterable<Widget> getHomePageAppBarSearchSuggestions(
  SearchController controller,
) {
  final String searchInputString = controller.value.text;
  List<SongQueryItemModel> songQueryItemList = findSongsWithString(
    searchInputString,
  );
  Map<String, SongModel> allSongs = SongManager().songs;

  return songQueryItemList.map((songQueryItem) {
    final fullLyricsPath = getSongFullPath(
      songQueryItem.songQueryItemFolderPath,
      songQueryItem.songQueryItemFilename,
    );

    if (allSongs.containsKey(fullLyricsPath)) {
      SongModel song = allSongs[fullLyricsPath]!;
      return SearchQueryResultListItemWidget(
        albumImagePath: songQueryItem.songQueryItemImagePath,
        songTitle: song.songTitle,
        songLyrics: song.songLyrics,
      );
    }
    return const ListTile();
  });
}
