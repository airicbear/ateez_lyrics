import 'package:ateez_lyrics/data/albums_data.dart';
import 'package:ateez_lyrics/model/album_model.dart';
import 'package:ateez_lyrics/model/song_query_item_model.dart';

List<SongQueryItemModel> getAllSongQueryItems() {
  List<SongQueryItemModel> allSongQueryItems = [];
  for (AlbumModel album in albums) {
    for (String lyricsPath in album.albumLyricsPaths) {
      SongQueryItemModel songQueryItem = SongQueryItemModel(
        songQueryItemAlbumTitle: album.albumTitle,
        songQueryItemFolderPath: album.albumLyricsFolderPath,
        songQueryItemLyricsPaths: album.albumLyricsPaths,
        songQueryItemFilename: lyricsPath,
        songQueryItemImagePath: album.albumImagePath,
      );
      allSongQueryItems.add(songQueryItem);
    }
  }
  return allSongQueryItems;
}
