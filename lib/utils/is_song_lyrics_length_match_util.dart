bool isSongLyricsLengthsMatch(Map<String, List<String>> lyrics) {
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
