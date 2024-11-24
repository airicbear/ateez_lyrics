class AlbumModel {
  final String albumTitle;
  final DateTime albumReleaseDate;
  final String albumImagePath;
  final String albumLyricsFolderPath;
  final List<String> albumLyricsPaths;

  AlbumModel({
    required this.albumTitle,
    required this.albumReleaseDate,
    required this.albumImagePath,
    required this.albumLyricsFolderPath,
    required this.albumLyricsPaths,
  });
}
