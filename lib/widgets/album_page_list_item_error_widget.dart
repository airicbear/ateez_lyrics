import 'package:flutter/material.dart';

class AlbumPageListItemErrorWidget extends StatelessWidget {
  static const String errorMessage = 'Error';

  const AlbumPageListItemErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(title: Text(errorMessage));
  }
}
