import 'package:ateez_lyrics/data/albums.dart';
import 'package:ateez_lyrics/ui/album_page.dart';
import 'package:ateez_lyrics/ui/main_app_bar.dart';
import 'package:ateez_lyrics/ui/page_transition.dart';
import 'package:flutter/material.dart';

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
          _HomeAppBar(),
          _HomeAlbumList(),
        ],
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  static const String ateezLogo = 'assets/images/misc/ateez_logo.png';
  static const String ateezGroupPic = 'assets/images/misc/ateez_group.jpg';

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      title: const ImageIcon(
        AssetImage(ateezLogo),
        size: 192,
      ),
      background: Image.asset(
        ateezGroupPic,
        fit: BoxFit.cover,
      ),
      expandedHeight: 256,
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
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          color: Colors.white38,
          width: 1,
        ),
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
    Key? key,
    required this.index,
  }) : super(key: key);

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

  const _HomeAlbumListItemTitle({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
