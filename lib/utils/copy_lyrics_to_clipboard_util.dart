import 'package:ateez_lyrics/utils/strip_html_tags_util.dart';
import 'package:clipboard/clipboard.dart';

Future<void> copyLyricsToClipboard(List<String> lyrics) {
  final text = lyrics.map(stripHtmlTags).join('\n');
  return FlutterClipboard.copy(text);
}
