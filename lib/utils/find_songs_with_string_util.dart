import 'package:ateez_lyrics/model/song_query_item_model.dart';
import 'package:ateez_lyrics/utils/get_all_song_query_items_util.dart';

List<SongQueryItemModel> findSongsWithString(String query) {
  final List<SongQueryItemModel> allSongs = getAllSongQueryItems();
  if (query.isEmpty) return allSongs;

  final List<SongQueryItemModel> results = [];
  final List<SongQueryItemModel> results1 = [];
  final List<SongQueryItemModel> results2 = [];
  final List<SongQueryItemModel> results3 = [];
  final List<SongQueryItemModel> results4 = [];

  query = query
      .trim()
      .replaceAll(RegExp(r'[^\w\s]+'), '') // Only keep alphabetical/whitespace
      .replaceAll(RegExp(r'\s\s+'), ' ') // Make multiple spaces into one
      .toLowerCase();

  for (var song in allSongs) {
    // Any words in song title start with query
    var b1 = song.songQueryItemFilename
        .toLowerCase()
        .split('_')
        .any((element) => element.startsWith(query));

    // Song title contains query
    var b2 = song.songQueryItemFilename
        .replaceAll('_', ' ')
        .toLowerCase()
        .contains(query);

    // Any words in album title start with query
    var b3 = song.songQueryItemAlbumTitle
        .toLowerCase()
        .split(' ')
        .any((element) => element.startsWith(query));

    // Album title contains query
    var b4 = song.songQueryItemAlbumTitle.toLowerCase().contains(query);

    if (b1) {
      results1.add(song);
    }

    if (b2) {
      results2.add(song);
    }

    if (b3) {
      results3.add(song);
    }

    if (b4) {
      results4.add(song);
    }
  }

  results.addAll(results1);
  results.addAll(results2);
  results.addAll(results3);
  results.addAll(results4);

  return results;
}
