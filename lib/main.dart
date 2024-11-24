import 'package:ateez_lyrics/notifiers/search_query_notifier.dart';
import 'package:ateez_lyrics/singletons/song_manager_singleton.dart';
import 'package:ateez_lyrics/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SongManager().loadSongs();

  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchQueryNotifier(),
      builder: (context, child) => const AppWidget(),
    ),
  );
}
