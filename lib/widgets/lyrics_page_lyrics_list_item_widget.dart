import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class LyricsPageLyricsListItemWidget extends StatelessWidget {
  final String lyricLine;

  const LyricsPageLyricsListItemWidget({
    super.key,
    required this.lyricLine,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      title: lyricLine.startsWith('[')
          ? HtmlWidget(
              lyricLine.substring(1, lyricLine.length - 1),
              textStyle: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
            )
          : HtmlWidget(lyricLine),
    );
  }
}
