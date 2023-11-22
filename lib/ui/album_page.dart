import 'dart:convert';

import 'package:ateez_lyrics/model/album.dart';
import 'package:ateez_lyrics/model/song.dart';
import 'package:ateez_lyrics/ui/lyrics_page.dart';
import 'package:ateez_lyrics/ui/common/main_app_bar.dart';
import 'package:ateez_lyrics/ui/common/page_transition.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  final Album album;

  const AlbumPage({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            _AlbumPageAppBar(
              album: album,
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(2.0),
              ),
            ),
            _AlbumPageList(
              album: album,
            ),
          ],
        ),
      ),
    );
  }
}

class _AlbumPageAppBar extends StatelessWidget {
  final Album album;

  const _AlbumPageAppBar({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            album.title,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 24,
            ),
          ),
        ),
      ),
      background: Image.asset(
        album.imagePath,
        fit: BoxFit.cover,
      ),
      expandedHeight: 256,
    );
  }
}

class _AlbumPageList extends StatelessWidget {
  final Album album;

  const _AlbumPageList({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _AlbumPageListItem(
          album: album,
          index: index,
        ),
        childCount: album.lyricsPaths.length,
      ),
    );
  }
}

class _AlbumPageListItem extends StatelessWidget {
  final Album album;
  final int index;

  const _AlbumPageListItem({
    Key? key,
    required this.album,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(_songPath(index)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final Song song = Song.fromJson(jsonDecode(snapshot.data.toString()));

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Colors.white38, width: 1),
            ),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                if (song.lyrics.isNotEmpty) {
                  _goToLyricsPage(context, album.imagePath, song);
                }
              },
              child: _AlbumPageListItemTitle(
                index: index,
                song: song,
              ),
            ),
          );
        } else {
          return _AlbumPageListItemError();
        }
      },
    );
  }

  String _songPath(int index) {
    return '${album.lyricsFolderPath}/${album.lyricsPaths[index]}';
  }

  void _goToLyricsPage(
    BuildContext context,
    String imagePath,
    Song song,
  ) {
    Navigator.of(context).push(
      PageTransition.to(
        LyricsPage(
          imagePath: imagePath,
          song: song,
        ),
      ),
    );
  }
}

class _AlbumPageListItemTitle extends StatelessWidget {
  final Song song;
  final int index;

  const _AlbumPageListItemTitle({
    Key? key,
    required this.song,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${index + 1}'),
      title: Text(
        song.title,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: song.lyrics.isEmpty
              ? Theme.of(context).disabledColor
              : Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
    );
  }
}

class _AlbumPageListItemError extends StatelessWidget {
  static const String errorMessage = 'Error';

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text(errorMessage),
    );
  }
}
