import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final Widget title;
  final Widget background;
  final double expandedHeight;

  const MainAppBar({
    Key? key,
    required this.title,
    required this.background,
    required this.expandedHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(top: 220),
        centerTitle: true,
        title: title,
        background: Stack(
          fit: StackFit.expand,
          children: [
            background,
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.0, -1.0),
                  end: const Alignment(0.0, 1.0),
                  stops: const [0.0, 0.3, 0.5, 1.0],
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
