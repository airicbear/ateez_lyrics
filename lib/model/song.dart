class Song {
  final String title;
  final Map<String, dynamic> lyrics;

  Song({
    required this.title,
    required this.lyrics,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'] as String,
      lyrics: json['lyrics'],
    );
  }
}
