import 'package:ateez_lyrics/model/album_model.dart';
import 'package:ateez_lyrics/widgets/album_page_widget.dart';
import 'package:flutter/material.dart';

void openAlbumPageWidget(BuildContext context, AlbumModel album) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => AlbumPageWidget(album: album),
    ),
  );
}
