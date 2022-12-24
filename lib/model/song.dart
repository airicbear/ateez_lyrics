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
    List<MapEntry> entries = lyrics.entries.toList();

    for (int i = 1; i < entries.length; i++) {
      for (int j = 0; j < i; j++) {
        if (entries[i].value?.length != entries[j].value?.length) {
          return false;
        }
      }
    }

    return true;
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
          List<int> indices = [];
          int i = 0;
          while (i < v.length) {
            if (v.elementAt(i).isEmpty ||
                (v.elementAt(i).startsWith('[') &&
                    v.elementAt(i).endsWith(']'))) {
              indices.add(i);
            }
            i++;
          }
          return MapEntry(k, '$indices');
        })
        .entries
        .map((e) => '${e.key}: ${e.value}')
        .join('\n');
  }

  static Map<String, int> _lyricLengths(Map<String, List<String>> lyrics) {
    return lyrics.map((key, value) => MapEntry(key, value.length));
  }
}
