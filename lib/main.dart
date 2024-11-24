import 'package:ateez_lyrics/widgets/app_widget.dart';
import 'package:ateez_lyrics/singletons/song_manager_singleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/search_query_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SongManager().loadSongs();

  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchQuery(),
      builder: (context, child) => const MyApp(),
    ),
  );
}
