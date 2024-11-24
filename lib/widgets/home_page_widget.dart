import 'package:ateez_lyrics/widgets/home_page_app_bar_widget.dart';
import 'package:ateez_lyrics/widgets/home_page_list_widget.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            const HomePageAppBarWidget(),
            HomePageListWidget(),
          ],
        ),
      ),
    );
  }
}
