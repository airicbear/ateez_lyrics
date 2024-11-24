import 'package:ateez_lyrics/utils/find_song_lyrics_sections_locations_util.dart';
import 'package:ateez_lyrics/utils/get_song_lyrics_lengths_util.dart';
import 'package:ateez_lyrics/utils/is_song_lyrics_length_match_util.dart';

class SongModel {
  final String songTitle;
  final Map<String, List<String>> songLyrics;

  SongModel({
    required this.songTitle,
    required this.songLyrics,
  }) : assert(
          isSongLyricsLengthsMatch(songLyrics),
          'Song lyrics for "$songTitle" must have matching number of lines.'
          '\n'
          '\n'
          'The length of each set of lyrics are as follows'
          '\n'
          '\n'
          '${getSongLyricsLengths(songLyrics)}'
          '\n'
          '\n'
          'The song lyrics have section location'
          '\n'
          '\n'
          '${findSongLyricsSectionsLocations(songLyrics)}'
          '\n',
        );

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      songTitle: '${json['title']}',
      songLyrics: Map<String, dynamic>.from(json['lyrics']).map(
        (key, list) => MapEntry(key, List<String>.from(list)),
      ),
    );
  }
}
