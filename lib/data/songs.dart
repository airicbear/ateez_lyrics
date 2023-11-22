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
  if (query.isEmpty) return allSongs;

  final Map<String, Album> results = {};
  final Map<String, Album> results1 = {};
  final Map<String, Album> results2 = {};
  final Map<String, Album> results3 = {};
  final Map<String, Album> results4 = {};

  query = query
      .trim()
      .replaceAll(RegExp(r'[^\w\s]+'), '') // Only keep alphabetical/whitespace
      .replaceAll(RegExp(r'\s\s+'), ' ') // Make multiple spaces into one
      .toLowerCase();

  allSongs.forEach((key, value) {
    // Any words in song title start with query
    var b1 = key
        .toLowerCase()
        .split('_')
        .any((element) => element.startsWith(query));

    // Song title contains query
    var b2 = key.replaceAll('_', ' ').toLowerCase().contains(query);

    // Any words in album title start with query
    var b3 = value.title
        .toLowerCase()
        .split(' ')
        .any((element) => element.startsWith(query));

    // Album title contains query
    var b4 = value.title.toLowerCase().contains(query);

    if (b1) {
      results1.putIfAbsent(key, () => value);
    }

    if (b2) {
      results2.putIfAbsent(key, () => value);
    }

    if (b3) {
      results3.putIfAbsent(key, () => value);
    }

    if (b4) {
      results4.putIfAbsent(key, () => value);
    }
  });

  results.addAll(results1);
  results.addAll(results2);
  results.addAll(results3);
  results.addAll(results4);

  return results;
}
