import 'package:ateez_lyrics/data/albums_data.dart';
import 'package:ateez_lyrics/model/album_model.dart';
import 'package:flutter/material.dart';

class HomePageAlbumListItemImageWidget extends StatelessWidget {
  final int index;

  const HomePageAlbumListItemImageWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final album = albums[index];
    final AlbumModel(albumImagePath: imagePath) = album;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Hero(
          tag: imagePath,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }
}
