import 'dart:convert';

import 'package:ateez_lyrics/model/song_model.dart';
import 'package:ateez_lyrics/model/song_query_item_model.dart';
import 'package:ateez_lyrics/utils/get_all_song_query_items_util.dart';
import 'package:ateez_lyrics/utils/get_song_full_path_util.dart';
import 'package:flutter/services.dart';

class SongManager {
  static SongManager? _instance;

  Map<String, SongModel> songs = {};

  SongManager._internal();

  factory SongManager() {
    _instance ??= SongManager._internal();
    return _instance!;
  }

  Future<void> loadSongs() async {
    List<String> jsonFilePaths = getAllSongQueryItems().map((songQueryItem) {
      final SongQueryItemModel(
        :songQueryItemFolderPath,
        :songQueryItemFilename
      ) = songQueryItem;

      return getSongFullPath(songQueryItemFolderPath, songQueryItemFilename);
    }).toList();

    for (String fullPath in jsonFilePaths) {
      if (songs.containsKey(fullPath)) continue;
      String jsonString = await rootBundle.loadString(fullPath);
      Map<String, dynamic> jsonObject = jsonDecode(jsonString);
      songs.putIfAbsent(fullPath, () => SongModel.fromJson(jsonObject));
    }
  }
}
