import 'dart:ffi';

class Song {
  final String title;
  final Map<String, List<String>> lyrics;

  Song({
    required this.title,
    required this.lyrics,
  }) : assert(
          lineCountMatch(lyrics),
          'Song lyrics for "$title" must have matching number of lines.'
          '\n'
          '\n'
          'The length of each set of lyrics are as follows'
          '\n'
          '\n'
          '${_lyricLengths(lyrics)}'
          '\n'
          '\n'
          'The lyrics have has section indices'
          '\n'
          '\n'
          '${_sectionIndices(lyrics)}'
          '\n',
        );

  static bool lineCountMatch(Map<String, List<String>> lyrics) {
    bool result = true;

    lyrics.forEach((key, value) {
      lyrics.forEach((key1, value1) {
        if (lyrics[key]?.length != lyrics[key1]?.length) {
          result = false;
        }
      });
    });

    return result;
  }

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: '${json['title']}',
      lyrics: Map<String, List<dynamic>>.from(json['lyrics'])
          .map((key, list) => MapEntry(key, List<String>.from(list))),
    );
  }

  /// Returns the number of lines for each
  /// section of a given set of lyrics
  static String _sectionIndices(Map<String, List<String>> lyrics) {
    return lyrics
        .map((k, v) {
          List<int> _indices = [];
          int i = 0;
          while (i < v.length) {
            if (v.elementAt(i).isEmpty ||
                (v.elementAt(i).startsWith('[') &&
                    v.elementAt(i).endsWith(']'))) {
              _indices.add(i);
            }
            i++;
          }
          return MapEntry(k, '$_indices');
        })
        .entries
        .map((e) => '${e.key}: ${e.value}')
        .join('\n');
  }

  static Map<String, int> _lyricLengths(Map<String, List<String>> lyrics) {
    return lyrics.map((key, value) => MapEntry(key, value.length));
  }
}
