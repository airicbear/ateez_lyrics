# ATEEZ Lyrics

An app that lets you read lyrics from each ATEEZ song.

### Add an album

- Add cover art

  - Get album cover art from [YouTube Music - ATEEZ](https://music.youtube.com/channel/UCmWwbZ-8SngcUzRAD8rCVvw)

  - Resize image to 500x500 and export to JPG

  - Add image to `assets/images/cover_art/`

- Add lyrics

  - Find songs lyrics at [Genius.com - ATEEZ](https://genius.com/artists/Ateez)

  - Set up scripts with `dart pub global activate --source path .`

  - Run script `get_lyrics <genius.com url>`

  - Add lyrics to `assets/lyrics/`

  - Add lyrics folder path to `pubspec.yaml`

  - Add album to `lib/data/albums.dart`

### Setup

- https://docs.flutter.dev/get-started/install

### Build and deploy

- https://docs.flutter.dev/deployment/android

- https://docs.flutter.dev/deployment/ios
