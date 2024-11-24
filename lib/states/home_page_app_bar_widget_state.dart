import 'package:ateez_lyrics/utils/get_home_page_app_bar_search_suggestions_util.dart';
import 'package:ateez_lyrics/widgets/home_page_app_bar_title_widget.dart';
import 'package:ateez_lyrics/widgets/home_page_app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePageAppBarState extends State<HomePageAppBarWidget> {
  final SearchController controller = SearchController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
      SearchAnchor(
        searchController: controller,
        builder: (context, controller) => IconButton(
          icon: const Icon(
            Icons.search,
            size: 32.0,
          ),
          onPressed: () {
            controller.openView();
          },
        ),
        suggestionsBuilder: (context, controller) =>
            getHomePageAppBarSearchSuggestions(controller),
      ),
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      sliver: SliverAppBar(
        expandedHeight: MediaQuery.of(context).size.height * 0.25,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        actions: actions,
        flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 2.0,
          collapseMode: CollapseMode.pin,
          titlePadding: const EdgeInsets.only(
            left: 16.0,
            top: 8.0,
            bottom: 8.0,
          ),
          title: HomePageAppBarTitleWidget(),
        ),
        pinned: true,
      ),
    );
  }
}
