import 'dart:convert';

import 'package:ateez_lyrics/data/albums.dart';
import 'package:ateez_lyrics/data/songs.dart';
import 'package:ateez_lyrics/model/album.dart';
import 'package:ateez_lyrics/model/search_query.dart';
import 'package:ateez_lyrics/model/song.dart';
import 'package:ateez_lyrics/ui/album_page.dart';
import 'package:ateez_lyrics/ui/lyrics_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/keep_alive_future_builder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            _HomeAppBar(),
            _HomeList(),
          ],
        ),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  // static const String ateezLogo = 'assets/images/misc/ateez_logo.png';
  // static const String ateezGroupPic = 'assets/images/misc/ateez_group_3.jpg';

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('ATEEZ Lyrics'),
      actions: [_SearchButton()],
      pinned: true,
    );
  }
}

class _SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchQuery>(
      builder: (context, searchQuery, child) => IconButton(
        onPressed: () => searchQuery.setEnabled(!searchQuery.enabled),
        icon: const Icon(
          Icons.search,
          size: 32,
        ),
      ),
    );
  }
}

class _HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchQuery>(
      builder: (context, searchQuery, child) =>
          searchQuery.enabled ? _SearchQueryResultList() : _HomeAlbumList(),
    );
  }
}

class _HomeAlbumList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _HomeAlbumListItem(
          index: index,
        ),
        childCount: albums.length,
      ),
    );
  }
}

class _HomeAlbumListItem extends StatelessWidget {
  final int index;

  const _HomeAlbumListItem({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AlbumPage(
              album: albums[index],
            ),
          ),
        ),
        child: Row(
          children: [
            _HomeAlbumListItemImage(
              index: index,
            ),
            _HomeAlbumListItemTitle(
              index: index,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeAlbumListItemImage extends StatelessWidget {
  final int index;

  const _HomeAlbumListItemImage({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        albums[index].imagePath,
      ),
    );
  }
}

class _HomeAlbumListItemTitle extends StatelessWidget {
  final int index;

  const _HomeAlbumListItemTitle({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          albums[index].title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class _SearchQueryResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchQuery>(builder: (context, searchQuery, child) {
      Map<String, Album> songs = filteredSongs(searchQuery.query);
      if (songs.isEmpty) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text(
                'No results found.',
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
            childCount: 1,
          ),
        );
      } else {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _SearchQueryResultListItem(
              entry: songs.entries.elementAt(index),
            ),
            childCount: songs.length,
          ),
        );
      }
    });
  }
}

class _SearchQueryResultListItem extends StatelessWidget {
  final MapEntry<String, Album> entry;

  const _SearchQueryResultListItem({
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchQuery>(
      builder: (context, searchQuery, child) => KeepAliveFutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('${entry.value.lyricsFolderPath}/${entry.key}'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Song song =
                Song.fromJson(jsonDecode(snapshot.data.toString()));

            return Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  if (song.lyrics.isNotEmpty) {
                    _goToLyricsPage(context, entry.value.imagePath, song);
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        entry.value.imagePath,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          song.title,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: song.lyrics.isEmpty
                                        ? Theme.of(context).disabledColor
                                        : Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.color,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
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
