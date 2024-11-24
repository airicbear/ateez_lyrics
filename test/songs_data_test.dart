import 'dart:convert';
import 'dart:io';

import 'package:ateez_lyrics/model/song_model.dart';
import 'package:ateez_lyrics/utils/find_json_files_util.dart';
import 'package:test/test.dart';

void main() {
  final List<File> jsonFiles = findJsonFiles(Directory('assets/lyrics'));

  for (final file in jsonFiles) {
    test('Verify song data from ${file.path}', () async {
      // Parse lyrics data
      final jsonString = await file.readAsString();
      final song = SongModel.fromJson(jsonDecode(jsonString));
      final SongModel(:songTitle, :songLyrics) = song;

      // Verify song title exists
      expect(songTitle, isNotEmpty);

      // Verify song lyrics have matching number of lines
      final expectedLength = songLyrics.values.firstOrNull?.length ?? 0;
      songLyrics.forEach((key, value) {
        expect(value.length, expectedLength);
      });
    });
  }
}
