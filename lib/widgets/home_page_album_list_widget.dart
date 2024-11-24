import 'package:ateez_lyrics/data/albums_data.dart';
import 'package:ateez_lyrics/widgets/home_page_album_list_item_widget.dart';
import 'package:flutter/material.dart';

class HomePageAlbumListWidget extends StatelessWidget {
  const HomePageAlbumListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => HomePageAlbumListItemWidget(index: index),
          childCount: albums.length,
        ),
      ),
    );
  }
}
