Map<String, int> getSongLyricsLengths(Map<String, List<String>> lyrics) {
  return lyrics.map((key, value) => MapEntry(key, value.length));
}
