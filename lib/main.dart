import 'package:ateez_lyrics/ui/home.dart';
import 'package:ateez_lyrics/util/song_manager.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/search_query.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;
        TextStyle textStyle = const TextStyle(
          fontFamily: 'Raleway',
        );
        TextTheme textTheme = TextTheme(
          displayLarge: textStyle,
          displayMedium: textStyle,
          displaySmall: textStyle,
          headlineLarge: textStyle,
          headlineMedium: textStyle,
          headlineSmall: textStyle,
          titleLarge: textStyle,
          titleMedium: textStyle,
          titleSmall: textStyle,
          bodyLarge: textStyle,
          bodyMedium: textStyle,
          bodySmall: textStyle,
          labelLarge: textStyle,
          labelMedium: textStyle,
          labelSmall: textStyle,
        );

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = const ColorScheme.light();
          darkColorScheme = const ColorScheme.dark();
        }

        lightColorScheme = lightColorScheme.copyWith(
          shadow: Colors.transparent,
        );
        darkColorScheme = darkColorScheme.copyWith(
          shadow: Colors.transparent,
        );

        return MaterialApp(
          theme: ThemeData(
            colorScheme: lightColorScheme,
            textTheme: textTheme,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            textTheme: textTheme,
          ),
          home: const Home(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
