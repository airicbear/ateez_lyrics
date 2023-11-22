import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final Widget title;
  final Widget background;
  final PreferredSizeWidget bottom;
  final double expandedHeight;
  final bool centerTitle;

  const MainAppBar({
    super.key,
    required this.title,
    this.background = const SizedBox.shrink(),
    this.bottom = const PreferredSize(
      preferredSize: Size(0, 0),
      child: SizedBox.shrink(),
    ),
    required this.expandedHeight,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight,
      bottom: bottom,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(vertical: 16.0),
        centerTitle: true,
        title: title,
        background: _BackgroundImage(
          background: background,
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final Widget background;

  const _BackgroundImage({
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
