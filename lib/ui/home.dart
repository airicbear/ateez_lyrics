import 'package:ateez_lyrics/data/albums.dart';
import 'package:ateez_lyrics/ui/album_page.dart';
import 'package:ateez_lyrics/ui/main_app_bar.dart';
import 'package:ateez_lyrics/ui/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MainAppBar(
            title: const ImageIcon(
              AssetImage('assets/images/misc/ateez_logo.png'),
              size: 192,
            ),
            background: Image.asset(
              'assets/images/misc/ateez_group.jpg',
              fit: BoxFit.cover,
            ),
            expandedHeight: 256,
          ),
          _HomeLyricsList(),
        ],
      ),
    );
  }
}

class _HomeLyricsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
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
            onTap: () => Navigator.of(context).push(
              PageTransition.to(
                AlbumPage(
                  album: albums[index],
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    albums[index].imagePath,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      albums[index].title,
                      style: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        childCount: albums.length,
      ),
    );
  }
}
