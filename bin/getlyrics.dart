import 'dart:core' show Future, List, RegExp, String, Uri;
import 'dart:io' show exitCode, stderr, stdout;
import 'package:http/http.dart' as http show read;
import 'package:html/parser.dart' as html_parser show parse;
import 'package:html/dom.dart' show Document, Element;

void main(List<String> arguments) async {
  exitCode = 0;

  if (arguments.isEmpty) {
    stderr.writeln('error: require at least one argument');
    exitCode = 2;
    return;
  }

  final String response = await request(arguments.first);
  final List<String> lyrics = parseGeniusLyrics(response, 'kUgSbL');
  printJsonFormat(lyrics);
}

/// Returns the body of an HTTP request to a given URL
Future<String> request(String url) {
  return http.read(Uri.parse(url));
}

/// Returns the lyrics given an HTML string from Genius.com
///
/// className is used to identify the lyrics content
List<String> parseGeniusLyrics(String html, String className) {
  final Document document = html_parser.parse(html);
  final List<Element> lyricsElements =
      document.querySelector('div')?.getElementsByClassName(className) ?? [];
  final String lyricsString =
      lyricsElements.map((e) => e.innerHtml).join('<br>');
  final RegExp brTagPattern = RegExp(r'<br\s*?>');
  return lyricsString.split(brTagPattern);
}

/// Prints each string wrapped with double quotes and appended with a comma
void printJsonFormat(List<String> strings) async {
  for (String string in strings) {
    stdout.writeln('"$string",');
  }
  await stdout.flush();
  await stdout.close();
}
