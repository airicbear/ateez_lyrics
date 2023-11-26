import 'package:ateez_lyrics/model/album.dart';
import 'package:ateez_lyrics/model/song.dart';
import 'package:ateez_lyrics/ui/lyrics_page.dart';
import 'package:ateez_lyrics/util/song_manager.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  final Album album;

  const AlbumPage({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      expandedHeight: MediaQuery.of(context).size.height * 0.45,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 8.0,
        ),
        centerTitle: true,
        expandedTitleScale: 1.0,
        collapseMode: CollapseMode.pin,
        background: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Hero(
            tag: album.imagePath,
            child: FittedBox(
              fit: BoxFit.contain,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  album.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            album.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      pinned: true,
    );
  }
}

class _AlbumPageList extends StatelessWidget {
  final Album album;

  const _AlbumPageList({
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _AlbumPageListItem(
            album: album,
            index: index,
          ),
          childCount: album.lyricsPaths.length,
        ),
      ),
    );
  }
}

class _AlbumPageListItem extends StatelessWidget {
  final Album album;
  final int index;

  const _AlbumPageListItem({
    required this.album,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, Song> allSongs = SongManager().songs;
    String path = _songPath(index);

    if (!allSongs.containsKey(path)) return _AlbumPageListItemError();

    Song song = allSongs[path]!;

    return Card(
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
      MaterialPageRoute(
        builder: (context) => LyricsPage(
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
    required this.song,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${index + 1}'),
      title: Text(
        song.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: song.lyrics.isEmpty
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).textTheme.titleMedium?.color,
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
