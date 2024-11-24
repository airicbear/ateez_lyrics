import 'package:ateez_lyrics/notifiers/search_query_notifier.dart';
import 'package:ateez_lyrics/utils/open_lyrics_page_widget_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchQueryResultListItemWidget extends StatelessWidget {
  final String albumImagePath;
  final String songTitle;
  final Map<String, List<String>> songLyrics;

  const SearchQueryResultListItemWidget({
    super.key,
    required this.albumImagePath,
    required this.songTitle,
    required this.songLyrics,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchQueryNotifier>(
      builder: (context, searchQuery, child) => Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            if (songLyrics.isNotEmpty) {
              openLyricsPageWidget(
                context,
                albumImagePath,
                songTitle,
                songLyrics,
              );
            }
          },
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      albumImagePath,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    songTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: songLyrics.isEmpty
                              ? Theme.of(context).disabledColor
                              : Theme.of(context).textTheme.titleMedium?.color,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
