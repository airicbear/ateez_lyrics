import 'package:ateez_lyrics/notifiers/search_query_notifier.dart';
import 'package:ateez_lyrics/widgets/home_page_album_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageListWidget extends StatelessWidget {
  const HomePageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchQueryNotifier>(
      builder: (context, searchQuery, child) => HomePageAlbumListWidget(),
    );
  }
}
