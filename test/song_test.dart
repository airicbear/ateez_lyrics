import 'dart:convert';
import 'dart:io';

import 'package:ateez_lyrics/model/song.dart';
import 'package:ateez_lyrics/util/utils.dart';
import 'package:test/test.dart';

void main() {
  final List<File> jsonFiles = findJsonFiles(Directory('assets/lyrics'));

  for (final file in jsonFiles) {
    test('Verify song data from ${file.path}', () async {
      // Parse lyrics data
      final jsonString = await file.readAsString();
      final song = Song.fromJson(json.decode(jsonString));

      // Verify song title exists
      expect(song.title, isNotEmpty);

      // Verify song lyrics have matching number of lines
      final expectedLength = song.lyrics.values.firstOrNull?.length ?? 0;
      song.lyrics.forEach((key, value) {
        expect(value.length, expectedLength);
      });
    });
  }
}
