import 'package:ateez_lyrics/ui/home.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/search_query.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchQuery(),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          lightColorScheme = lightColorScheme.copyWith();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = const ColorScheme.light();
          darkColorScheme = const ColorScheme.dark();
        }

        return MaterialApp(
          theme: ThemeData(
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
          ),
          home: const Home(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
