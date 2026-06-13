import 'package:ateez_lyrics/utils/strip_html_tags_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('stripHtmlTags', () {
    test('passes plain text through unchanged', () {
      expect(stripHtmlTags('Hello world'), 'Hello world');
    });

    test('removes italic tags', () {
      expect(stripHtmlTags('<i>Running out</i>'), 'Running out');
    });

    test('removes bold tags', () {
      expect(stripHtmlTags('<b>Away from here</b>'), 'Away from here');
    });

    test('removes nested bold-italic tags', () {
      expect(stripHtmlTags('<b><i>text</i></b>'), 'text');
    });

    test('removes inline tags mixed with plain text', () {
      expect(
        stripHtmlTags('<i>Running, running out</i> (<b>Away from here</b>)'),
        'Running, running out (Away from here)',
      );
    });

    test('leaves empty string unchanged', () {
      expect(stripHtmlTags(''), '');
    });

    test('leaves section headers unchanged', () {
      expect(
        stripHtmlTags('[Verse 1: Hongjoong]'),
        '[Verse 1: Hongjoong]',
      );
    });
  });
}
