import 'dart:convert';

import 'package:ateez_lyrics/data/songs.dart';
import 'package:ateez_lyrics/model/song.dart';
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
    Map<String, String> jsonFilePaths = songPathToAlbum()
        .map((key, value) => MapEntry(key, '${value.lyricsFolderPath}/$key'));

    for (var entry in jsonFilePaths.entries) {
      String filename = entry.key;
      String fullPath = entry.value;
      String jsonString = await rootBundle.loadString(fullPath);
      Map<String, dynamic> jsonObject = json.decode(jsonString);
      songs.putIfAbsent(filename, () => Song.fromJson(jsonObject));
    }
    ;
  }
}
