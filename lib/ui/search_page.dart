import 'package:ateez_lyrics/model/search_query.dart';
import 'package:ateez_lyrics/ui/common/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _SearchPageAppBar(),
        ],
      ),
    );
  }
}

class _SearchPageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      title: SizedBox(
        width: 280,
        child: Consumer<SearchQuery>(
          builder: (context, searchQuery, child) => TextField(
            onChanged: (value) => searchQuery.setQuery(value),
          ),
        ),
      ),
      centerTitle: false,
      expandedHeight: 0,
    );
  }
}

class _SearchPageResults extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageResultsState();
}

class _SearchPageResultsState extends State<_SearchPageResults> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: Consumer<SearchQuery>(
            builder: (context, value, child) => Text(value.query),
          ),
        ),
        childCount: 1,
      ),
    );
  }
}
