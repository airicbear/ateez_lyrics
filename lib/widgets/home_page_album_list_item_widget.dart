import 'package:ateez_lyrics/data/albums_data.dart';
import 'package:ateez_lyrics/utils/open_album_page_widget_util.dart';
import 'package:ateez_lyrics/widgets/home_page_album_list_item_image_widget.dart';
import 'package:ateez_lyrics/widgets/home_page_album_list_item_title_widget.dart';
import 'package:flutter/material.dart';

class HomePageAlbumListItemWidget extends StatelessWidget {
  final int index;

  const HomePageAlbumListItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final album = albums[index];

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => openAlbumPageWidget(context, album),
        child: Row(
          children: [
            HomePageAlbumListItemImageWidget(index: index),
            HomePageAlbumListItemTitleWidget(index: index),
          ],
        ),
      ),
    );
  }
}
