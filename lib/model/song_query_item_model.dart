class SongQueryItemModel {
  final String songQueryItemAlbumTitle;
  final List<String> songQueryItemLyricsPaths;
  final String songQueryItemFolderPath;
  final String songQueryItemFilename;
  final String songQueryItemImagePath;

  SongQueryItemModel({
    required this.songQueryItemAlbumTitle,
    required this.songQueryItemFolderPath,
    required this.songQueryItemLyricsPaths,
    required this.songQueryItemFilename,
    required this.songQueryItemImagePath,
  });
}
