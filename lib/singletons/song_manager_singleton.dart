import 'dart:convert';

import 'package:ateez_lyrics/data/songs_data.dart';
import 'package:ateez_lyrics/model/song_model.dart';
import 'package:flutter/services.dart';

class SongManager {
  static SongManager? _instance;

  Map<String, Song> songs = {};

  SongManager._internal();

  factory SongManager() {
    _instance ??= SongManager._internal();
    return _instance!;
  }

  Future<void> loadSongs() async {
    List<String> jsonFilePaths = songPathToAlbum()
        .entries
        .map((entry) => '${entry.value.lyricsFolderPath}/${entry.key}')
        .toList();

    for (String fullPath in jsonFilePaths) {
      if (songs.containsKey(fullPath)) continue;
      String jsonString = await rootBundle.loadString(fullPath);
      Map<String, dynamic> jsonObject = json.decode(jsonString);
      songs.putIfAbsent(fullPath, () => Song.fromJson(jsonObject));
    }
  }
}
