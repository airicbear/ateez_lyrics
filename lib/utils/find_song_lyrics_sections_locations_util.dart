/// Returns the number of lines for each
/// section of a given set of lyrics
String findSongLyricsSectionsLocations(Map<String, List<String>> songLyrics) {
  return songLyrics
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
