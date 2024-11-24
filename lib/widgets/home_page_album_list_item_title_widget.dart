import 'package:ateez_lyrics/data/albums_data.dart';
import 'package:ateez_lyrics/model/album_model.dart';
import 'package:flutter/material.dart';

class HomePageAlbumListItemTitleWidget extends StatelessWidget {
  final int index;

  const HomePageAlbumListItemTitleWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final album = albums[index];
    final AlbumModel(albumTitle: title) = album;
    final TextStyle? textStyle =
        Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            );

    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(title, style: textStyle),
      ),
    );
  }
}
