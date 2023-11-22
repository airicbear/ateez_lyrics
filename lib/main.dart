import 'package:ateez_lyrics/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'model/search_query.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchQuery(),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATEEZ Lyrics',
      theme: ThemeData(
        cardTheme: const CardTheme(
          elevation: 5,
          shadowColor: Colors.transparent,
          clipBehavior: Clip.hardEdge,
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
