import 'package:ateez_lyrics/model/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class LyricsPage extends StatefulWidget {
  final String imagePath;
  final Song song;

  const LyricsPage({
    super.key,
    required this.song,
    required this.imagePath,
  });

  @override
  State<StatefulWidget> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage>
    with SingleTickerProviderStateMixin {
  late List<dynamic> lyrics;
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: widget.song.lyrics.length,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {
        lyrics = widget.song.lyrics.values.toList()[tabController.index];
      });
    });
    lyrics = widget.song.lyrics.entries.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.song.lyrics.length > 1
          ? SafeArea(
              child: _LyricsPageTabBar(
                tabController: tabController,
                song: widget.song,
              ),
            )
          : const SizedBox.shrink(),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            _LyricsPageAppBar(
              imagePath: widget.imagePath,
              song: widget.song,
            ),
            _LyricsPageLyricList(
              lyrics: lyrics,
            ),
          ],
        ),
      ),
    );
  }
}

class _LyricsPageTabBar extends StatelessWidget {
  final TabController tabController;
  final Song song;

  const _LyricsPageTabBar({
    required this.tabController,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: List<Tab>.generate(
        song.lyrics.length,
        (index) => Tab(
          text: song.lyrics.keys.toList()[index].toUpperCase(),
        ),
      ),
      labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _LyricsPageAppBar extends StatelessWidget {
  final Song song;
  final String imagePath;

  const _LyricsPageAppBar({
    required this.song,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isExpanded = constraints.maxHeight * 0.3 > kToolbarHeight;

          return FlexibleSpaceBar(
            titlePadding: const EdgeInsetsDirectional.only(
              start: 72,
              bottom: 16,
              end: 16,
            ),
            centerTitle: false,
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                    BlendMode.dstATop,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              song.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: isExpanded ? 2 : 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
      pinned: true,
    );
  }
}

class _LyricsPageLyricList extends StatelessWidget {
  final List<dynamic> lyrics;

  const _LyricsPageLyricList({
    required this.lyrics,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final String line = lyrics[index];

          return _LyricsPageLyricListItem(
            line: line,
          );
        },
        childCount: lyrics.length,
      ),
    );
  }
}

class _LyricsPageLyricListItem extends StatelessWidget {
  final String line;

  const _LyricsPageLyricListItem({
    required this.line,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      title: line.startsWith('[')
          ? HtmlWidget(
              line.substring(1, line.length - 1),
              textStyle: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
            )
          : HtmlWidget(line),
    );
  }
}
