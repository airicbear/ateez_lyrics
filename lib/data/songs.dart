import 'package:ateez_lyrics/data/albums.dart';
import 'package:ateez_lyrics/model/album.dart';

Map<String, Album> songs() {
  Map<String, Album> songs = {};
  for (Album album in albums) {
    for (String song in album.lyricsPaths) {
      songs.putIfAbsent(song, () => album);
    }
  }
  return songs;
}

Map<String, Album> filteredSongs(String query) {
  final Map<String, Album> allSongs = songs();
  final Map<String, Album> results = {};

  query = query
      .trim()
      .replaceAll(RegExp(r'[^\w\s]+'), '') // Only keep alphabetical/whitespace
      .replaceAll(RegExp(r'\s\s+'), ' ') // Make multiple spaces into one
      .toLowerCase();

  // Any words in song title start with query
  allSongs.forEach((key, value) {
    if (key
        .toLowerCase()
        .split('_')
        .any((element) => element.startsWith(query))) {
      results.putIfAbsent(key, () => value);
    }
  });

  // Song title contains query
  allSongs.forEach((key, value) {
    if (key.replaceAll('_', ' ').toLowerCase().contains(query)) {
      results.putIfAbsent(key, () => value);
    }
  });

  // Any words in album title start with query
  allSongs.forEach((key, value) {
    if (value.title
        .toLowerCase()
        .split(' ')
        .any((element) => element.startsWith(query))) {
      results.putIfAbsent(key, () => value);
    }
  });

  // Album title contains query
  allSongs.forEach((key, value) {
    if (value.title.toLowerCase().contains(query)) {
      results.putIfAbsent(key, () => value);
    }
  });

  return results;
}
