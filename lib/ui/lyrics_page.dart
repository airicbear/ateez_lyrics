import 'package:ateez_lyrics/model/song.dart';
import 'package:ateez_lyrics/ui/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class LyricsPage extends StatefulWidget {
  final String imagePath;
  final Song song;

  const LyricsPage({
    Key? key,
    required this.song,
    required this.imagePath,
  }) : super(key: key);

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
    tabController =
        TabController(length: widget.song.lyrics.length, vsync: this);
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
      bottomNavigationBar: TabBar(
        controller: tabController,
        tabs: List<Tab>.generate(
          widget.song.lyrics.length,
          (index) => Tab(
            text: widget.song.lyrics.keys.toList()[index].toUpperCase(),
          ),
        ),
        labelStyle: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          MainAppBar(
            title: Text(
              widget.song.title,
              style: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
            expandedHeight: 256,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final String line = lyrics[index];
                return ListTile(
                  title: line.startsWith('[')
                      ? HtmlWidget(
                          line.substring(1, line.length - 1),
                          textStyle: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16.0,
                            color: Theme.of(context).disabledColor,
                          ),
                        )
                      : HtmlWidget(
                          line,
                          textStyle: const TextStyle(
                            fontFamily: 'Raleway',
                          ),
                        ),
                );
              },
              childCount: lyrics.length,
            ),
          ),
        ],
      ),
    );
  }
}
