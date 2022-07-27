import 'dart:convert';

import 'package:ateez_lyrics/model/album.dart';
import 'package:ateez_lyrics/model/song.dart';
import 'package:ateez_lyrics/ui/lyrics_page.dart';
import 'package:ateez_lyrics/ui/main_app_bar.dart';
import 'package:ateez_lyrics/ui/page_transition.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  final Album album;

  const AlbumPage({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MainAppBar(
            title: Text(
              album.title,
              style: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            background: Image.asset(
              album.imagePath,
              fit: BoxFit.cover,
            ),
            expandedHeight: 256,
          ),
          const SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.all(2.0)),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString(
                    '${album.lyricsFolderPath}/${album.lyricsPaths[index]}'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final Song song =
                        Song.fromJson(jsonDecode(snapshot.data.toString()));
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
                            Navigator.of(context).push(
                              PageTransition.to(
                                LyricsPage(
                                  imagePath: album.imagePath,
                                  song: song,
                                ),
                              ),
                            );
                          }
                        },
                        child: ListTile(
                          leading: Text('${index + 1}'),
                          title: Text(
                            song.title,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: song.lyrics.isEmpty
                                  ? Theme.of(context).disabledColor
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.color,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const ListTile(
                      title: Text('Error'),
                    );
                  }
                },
              ),
              childCount: album.lyricsPaths.length,
            ),
          ),
        ],
      ),
    );
  }
}
